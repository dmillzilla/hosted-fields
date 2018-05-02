class CheckoutsController < ApplicationController
  def new
    @client_token = gateway.client_token.generate
  end

  def show
    @transaction = gateway.transaction.find(params[:id])
  end
  
  def create
    email = params["email"]
    first_name = params["first_name"]
    last_name = params["last_name"]
    nonce = params["payment_method_nonce"]
    
    customer_creation = gateway.customer.create(
      :email => email,
      :first_name => first_name,
      :last_name => last_name,
      :payment_method_nonce => nonce
    )
    if customer_creation.success?
      token = customer_creation.customer.payment_methods[0].token
      result = gateway.transaction.sale(
        :amount => "10.00",
        :payment_method_token => token
      )
  
      if result.success?
        redirect_to checkout_path(result.transaction.id)
      else
        puts "Error"
        result.errors.each do |error|
          puts error.message
        end
      end
    else
      p customer_creation.errors
    end
  end
  
  def gateway
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => '235zhthv55dqtgks',
      :public_key => 'bf4264t9tz94jc8w',
      :private_key => 'f07777fe3b7287052b9f5f167a1283fc',
    )
  end
end
