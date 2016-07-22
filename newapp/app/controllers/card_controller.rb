class CardController < ApplicationController
  def index
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      source: token,
      description: 'first example user'
      )

    # Stripe::Charge.create(
    #   amount: 1000,
    #   currency: 'usd',
    #   customer: customer.id)

    redirect_to root_path
  end
end
