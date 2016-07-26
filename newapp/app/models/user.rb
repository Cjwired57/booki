class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true
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

  def bets
    output = []
    self.bets_as_owner.each do |bet|
      output << bet
    end
    self.bets_as_opponent.each do |bet|
      output << bet
    end
    output
  end

  def total_winnings
    total = 0

    self.bets.each do |bet|
      if bet.winner_id = self.id
        total += bet.amount
      end
    end
    total
  end


end
