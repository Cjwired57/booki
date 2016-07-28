class RequestController < ApplicationController



  def create
    if request.xhr?

      home_team_id = params[:home_team_id]
      away_team_id = params[:away_team_id]
      user_choice = params[:user_choice]

      if user_choice == 'home'
        user_choice_id = home_team_id
        opponent_choice_id = away_team_id
      else
        user_choice_id = away_team_id
        opponent_choice_id = home_team_id
      end

      game_id = params[:game_id]
      bet_amount = params[:bet_amount]
      opponent_email = params[:opponent_email]
      opponent = User.find_by(email: opponent_email)

      request = Request.create(
        owner_id: current_user.id,
        opponent_id: opponent.id,
        owner_team_id: user_choice_id,
        opponent_team_id: opponent_choice_id,
        game_id: game_id,
        accepted: false,
        bet_amount: bet_amount
        )
    else
      # lame non-ajax route
    end
  end


end
