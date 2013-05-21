class AddSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    add_column :users, :age, :integer
    add_column :users, :date_of_birth, :date
  end
end
