class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :description
      t.integer :duration
      t.integer :user_id
      t.datetime :due_date
      t.text :comments
      t.text :metadata
      t.integer :task_id
      t.boolean :is_done
      t.boolean :is_vetoed

      t.timestamps
    end
    add_index :items, :task_id
  end
end
