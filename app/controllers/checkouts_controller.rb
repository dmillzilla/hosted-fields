class CheckoutsController < ApplicationController
  def new
    @client_token = gateway.client_token.generate
  end

  def show
    @customer = gateway.customer.find(params[:id])
  end
  
  def create
    email = params["email"]
    first_name = params["first_name"]
    last_name = params["last_name"]
    
    customer_creation = gateway.customer.create(
      :email => email,
      :first_name => first_name,
      :last_name => last_name
    )
    if customer_creation.success?
      redirect_to checkout_path(customer_creation.customer.id)
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
