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
  end
end
