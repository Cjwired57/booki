class Bet < ActiveRecord::Base
  belongs_to :request
  belongs_to :winner, class_name: 'User'

  def amount
    request = Request.find(self.request_id)
    request.bet_amount
  end

end
