require "stripe"

class BetController < ApplicationController
	Stripe.api_key = "sk_test_LaGOwlDvqeTDlyYRBnWN1y4W"

	def index
		@user = current_user
		@games = Game.all
    	@bets = Bet.all
  	end

	def create
		p "you hit the bet post"


		Bet.create(request_id: params[:request_id])
		request = Request.find(params[:request_id])
		request.accepted = true
		request.save

		@opponent = User.find(request.opponent_id)
		@owner = User.find(request.owner_id)
		@bet_amount = request.bet_amount_in_cents

		Stripe::Charge.create(
	      amount: @bet_amount,
	      currency: 'usd',
	      customer: @owner.customer_id
      )

		Stripe::Charge.create(
	      amount: @bet_amount,
	      currency: 'usd',
	      customer: @opponent.customer_id
      )

		redirect_to request_index_path
	end
      # t.integer :request_id
      # t.integer :winner_id

end
