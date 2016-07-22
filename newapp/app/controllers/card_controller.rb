require "stripe"

class CardController < ApplicationController
  Stripe.api_key = "sk_test_LaGOwlDvqeTDlyYRBnWN1y4W"

  def index
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      source: token,
      description: 'first example user'
      )

    @user = User.new(email: 'test@test.com', customer_id: customer.id)
    @user.password = '1234'
    @user.save

    Stripe::Charge.create(
      amount: 10000000,
      currency: 'usd',
      customer: @user.customer_id)

    redirect_to root_path
  end
end
