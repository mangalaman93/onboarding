class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
