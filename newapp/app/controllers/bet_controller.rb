class BetController < ApplicationController
	def create
		p "you hit the bet post"
		Bet.create(request_id: params[:request_id])
		request = Request.find(params[:request_id])
		request.accepted = true
		request.save
		redirect_to request_index_path
	end
      # t.integer :request_id
      # t.integer :winner_id

end
