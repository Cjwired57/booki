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
  has_many :bets, through: :requests
  has_many :requests
  has_secure_password
end
