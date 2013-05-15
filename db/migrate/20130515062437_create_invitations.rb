class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :from_id
      t.integer :to_id
      t.text :content
      t.string :guid
      t.datetime :sent_date
      t.boolean :is_confirmed

      t.timestamps
    end
    add_index :invitations, :from_id
    add_index :invitations, :to_id
  end
end
