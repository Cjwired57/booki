class RequestController < ApplicationController

  def index
    @teams = Team.all
    @user = current_user
  end


  def create
    # if request.xhr?

      params2 = params[:request]
      p '*'*50
      p params2
      p '*'*50
      opponent_email = params2[:opponent]
      bet_amount_in_cents = params2[:amount].to_i
      user_choice = params2[:team_choice]
      game_id = params2[:game_id]
      # p game_id
      # game_id.to_i!
      # p game_id

      game = Game.find(game_id)

      home_team_id = Team.find(game.home_team_id).id
      away_team_id = Team.find(game.away_team_id).id

      if user_choice == 'home_team'
        user_choice_id = home_team_id
        opponent_choice_id = away_team_id
      else
        user_choice_id = away_team_id
        opponent_choice_id = home_team_id
      end

      opponent = User.find_by(email: opponent_email)

      if opponent
        request = Request.new(
          owner_id: current_user.id,
          opponent_id: opponent.id,
          owner_team_id: user_choice_id,
          opponent_team_id: opponent_choice_id,
          game_id: game_id,
          accepted: false,
          bet_amount_in_cents: bet_amount_in_cents
          )
         if request.save
          p request
          redirect_to root_path
         else
         flash[:danger] = "You have already placed a bet on this game with this opponent"
        p '*'*50
        p 'there was a problem finding your opponent'
        redirect_to "/game/#{game_id}"
        end
      end
    # else
    #   # lame non-ajax route
    #   p 'someone hit the other route'
    # end
  end




end
