class Game < ActiveRecord::Base

  has_many :requests
  has_many :bets, through: :requests

  has_many :teams

  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  validates :home_team_id, :away_team_id, :start_time, presence: true

  def self.current_games
    Game.where(finished: true)
  end

  def self.past_games
    Game.where(finished: false)
  end

end
