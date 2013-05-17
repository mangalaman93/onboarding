class RemoveToidFromInvitations < ActiveRecord::Migration
  def up
  	rename_column :invitations, :to_id, :to_email
  end

  def down
  	rename_column :invitations, :to_email, :to_id
  end
end
