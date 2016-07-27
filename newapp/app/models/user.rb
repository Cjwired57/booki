class User < ActiveRecord::Base
  include BCrypt
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
  has_one :managed_account

  has_many :requests_as_owner, class_name: 'Request', foreign_key: :owner_id
  has_many :requests_as_opponent, class_name: 'Request', foreign_key: :opponent_id

  has_many :bets_as_owner, through: :requests_as_owner, source: :bet
  has_many :bets_as_opponent, through: :requests_as_opponent, source: :bet
  has_secure_password

  def requests
    self.requests_as_owner + self.requests_as_opponent
  end

  def bets
    self.bets_as_owner + self.bets_as_opponent
  end

  def total_winnings
    total = 0
    self.bets_won.each do |bet|
        total += bet.amount
    end
    total
  end

  def bets_won
    won_bets = []
    self.bets.each do |bet|
      if bet.winner_id = self.id
        won_bets << bet
      end
    end
    won_bets
  end

  def bets_lost

  end

  def current_bets

  end


end
