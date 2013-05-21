class AddToEmailToInvitations < ActiveRecord::Migration
  def change
  	change_column :invitations, :to_email, :string
  end
end
