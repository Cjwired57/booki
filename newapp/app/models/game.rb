class Game < ActiveRecord::Base

  validates :home_team, :away_team, :start_time, presence: true
end
