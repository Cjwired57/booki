class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.integer :opponent_id
      t.integer :owner_team_id
      t.integer :opponent_team_id
      t.integer :game_id
      t.boolean :accepted
      t.integer :bet_amount_in_cents

      t.timestamps null: false
    end
  end
end
