class CheckoutsController < ApplicationController #:nodoc:
  def new
    @client_token = gateway.client_token.generate
  end

  def show
    @transaction = gateway.transaction.find(params[:id])
  end

  def create
    email = params['email']
    first_name = params['first_name']
    last_name = params['last_name']
    nonce = params['payment_method_nonce']
    amount = params['amount']

    customer_creation = gateway.customer.create(
      email: email,
      first_name: first_name,
      last_name: last_name,
      payment_method_nonce: nonce
    )

    if customer_creation.success?
      token = customer_creation.customer.payment_methods[0].token
    else
      p customer_creation.errors
    end 
      
    result = gateway.transaction.sale(
      amount: amount,
      payment_method_token: token
    )

    if result.success?
      redirect_to checkout_path(result.transaction.id)
    else
      flash[:danger] = 'Try again. The transaction failed with the following
                       error: ' + result.message + ' (' +
                       result.transaction.processor_response_code + ')'
      redirect_to root_path
    end
    
  end

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['BRAINTREE_MERCHANT_ID'],
      public_key: ENV['BRAINTREE_PUBLIC_KEY'],
      private_key: ENV['BRAINTREE_PRIVATE_KEY']
    )
  end
end
