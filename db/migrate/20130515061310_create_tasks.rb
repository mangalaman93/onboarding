class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :creator_id
      t.integer :owner_id
      t.datetime :invitation_sentdate
      t.boolean :owner_confirmed
      t.integer :plan_id

      t.timestamps
    end
  end
end
