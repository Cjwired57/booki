class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.integer :opponent_id
      t.integer :game_id
      t.boolean :accepted
      t.float :bet_amount

      t.timestamps null: false
    end
  end
end
