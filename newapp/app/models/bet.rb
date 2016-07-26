class Bet < ActiveRecord::Base
  belongs_to :request
  belongs_to :winner, class_name 'User'
end
