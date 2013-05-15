class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.integer :user_id
      t.integer :creator_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :hr_id
      t.integer :bu_id
      t.integer :manager_id
      t.integer :mentor_id

      t.timestamps
    end
  end
end
