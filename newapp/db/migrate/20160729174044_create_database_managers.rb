class CreateDatabaseManagers < ActiveRecord::Migration
  def change
    create_table :database_managers do |t|

      t.timestamps null: false
    end
  end
end
