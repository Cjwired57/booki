class Team < ActiveRecord::Base

  has_many :games
  validates :name, :city, :logo_url, :stadium, presence: true
end
