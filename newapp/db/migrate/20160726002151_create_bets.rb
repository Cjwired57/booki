class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :request_id
      t.integer :winner_id

      t.timestamps null: false
    end
  end
end
