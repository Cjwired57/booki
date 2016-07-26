class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :label
      t.string :full_name

      t.string :home_team
      t.string :away_team
      t.string :winning_team
      t.integer :home_team_score
      t.integer :away_team_score
      t.integer :spread
      t.datetime :start_time
      t.boolean :finished, default: false

      t.timestamps null: false
    end
  end
end
