class CreateManagedAccounts < ActiveRecord::Migration
  def change
    create_table :managed_accounts do |t|
      t.integer :user_id
      t.string  :account_id
      t.string  :secret_key
      t.string  :publishable_key

      t.timestamps null: false
    end
  end
end
