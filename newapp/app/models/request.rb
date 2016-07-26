class Request < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :opponent, class_name: 'User'
  belongs_to :game
  has_one :bet

  validates :owner_id, :game_id, :opponent_id, :bet_amount, presence: true
end
