class CreateGroups < ActiveRecord::Migration
  def change
  	drop_table :groups
    create_table :groups do |t|
      t.integer :no_users

      t.timestamps
    end
  end
end
