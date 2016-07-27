require "stripe"

class CardController < ApplicationController
  Stripe.api_key = "sk_test_LaGOwlDvqeTDlyYRBnWN1y4W"

  def index
  end

  def create
    if request.xhr?
      p params
      token = params[:token]
      p token
      p "****"*50
      customer = Stripe::Customer.create(
        source: token,
        description: 'first example user'
        )

      @user = current_user
      @user.customer_id = customer.id
      @user.save

      p @user
      p "****"*50

      return "cool"
    else

    # Stripe::Charge.create(

    #   amount: 100,
    #   currency: 'usd',
    #   customer: @user.customer_id)

redirect_to root_path
end

end
