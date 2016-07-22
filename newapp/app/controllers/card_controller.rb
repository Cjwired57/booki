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

    @user = User.create(email: 'test@test.com', password_hash: '1234', customer_id: customer.id)

    Stripe::Charge.create(
      amount: 10000000,
      currency: 'usd',
      customer: @user.customer_id)

    redirect_to root_path
  end
end
