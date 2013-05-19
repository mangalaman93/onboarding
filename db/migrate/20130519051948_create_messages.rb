class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :thread_id
      t.integer :sender_id
      t.integer :group_id
      t.text :body

      t.timestamps
    end
  end
end
