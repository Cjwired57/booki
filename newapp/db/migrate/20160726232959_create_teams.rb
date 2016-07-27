class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
        t.string :name
        t.string :city
        t.string :logo_url
        t.string :stadium
        t.datetime :founded_in

      t.timestamps null: false
    end
  end
end
