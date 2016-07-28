class Team < ActiveRecord::Base

  has_many :games_as_home_team, class_name: 'Game', foreign_key: :home_team_id
  has_many :games_as_away_team, class_name: 'Game', foreign_key: :away_team_id

  validates :name, :city, :logo_url, :stadium, presence: true

  def games
    self.games_as_home_team + self.games_as_away_team
  end

  def full_name
    "#{self.city} #{self.name}"
  end

end
