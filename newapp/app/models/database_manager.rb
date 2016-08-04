require 'stattleship'

class DatabaseManager < ActiveRecord::Base

  Stattleship.configure do |config|
    config.api_token = '5faa60b51939bb1b58b5cc0594a2b12b'
  end

  def create_todays_games

    query_params = Stattleship::Params::BaseballGamesParams.new
    query_params.season_id = 'mlb-2016'
    query_params.status = 'upcoming'
    query_params.on = 'today'

    games = Stattleship::BaseballGames.fetch(params: query_params)

    if games.length > 0
      games.each do |game|
        home_team = Team.find_by(name: game.home_team.nickname)
        away_team = Team.find_by(name: game.away_team.nickname)
        if home_team && away_team
          home_team_id = home_team.id
          away_team_id = away_team.id

          Game.create(
            label: game.label,
            full_name: game.name,
            home_team_id: home_team_id,
            away_team_id: away_team_id,
            start_time: game.started_at
            )

        end
      end
    end
  end

  def update_yesterdays_games
    query_params = Stattleship::Params::BaseballGamesParams.new

    query_params.season_id = 'mlb-2016'
    query_params.on = 'yesterday'

    games = Stattleship::BaseballGames.fetch(params: query_params)

    if games.length > 0
      games.each do |game|
        g = Game.find_by(full_name: game.name)
        if g
          winning_team = Team.find_by(name: game.winning_team.nickname)
          g.update(
            home_team_score: game.home_team_score,
            away_team_score: game.away_team_score,
            finished: true,
            winning_team_id: winning_team.id
            )
        else

          home_team = Team.find_by(name: game.home_team.nickname)
          away_team = Team.find_by(name: game.away_team.nickname)
          winning_team = Team.find_by(name: game.winning_team.nickname)

          if home_team && away_team
            home_team_id = home_team.id
            away_team_id = away_team.id
            winning_team_id = winning_team.id
            g = Game.create(
              label: game.label,
              full_name: game.name,
              home_team_id: home_team_id,
              away_team_id: away_team_id,
              start_time: game.started_at,
              home_team_score: game.home_team_score,
              away_team_score: game.away_team_score,
              finished: true,
              winning_team_id: winning_team_id
              )
          end
        end
      end
    end
  end

  def update_bets

  end


end



