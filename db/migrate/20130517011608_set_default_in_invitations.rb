class SetDefaultInInvitations < ActiveRecord::Migration
  def change
  	change_column :invitations, :sent_date, :datetime, :default => Time.now
    change_column :invitations, :is_confirmed, :boolean, :default => false
  end
end
