class Game < ActiveRecord::Base

  has_many :requests
  has_many :bets, through: :requests
  validates :home_team, :away_team, :start_time, presence: true
end
