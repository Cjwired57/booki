class Game < ActiveRecord::Base

  has_many :requests
  has_many :bets, through: :requests
  validates :home_team_id, :away_team_id, :start_time, presence: true
end
