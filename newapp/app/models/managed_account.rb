class ManagedAccount < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :account_id, :secret_key, :publishable_key, presence: true

end
