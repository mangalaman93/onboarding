class GroupsUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  validates :group_id, :presence => true
  validates :user_id, :presence => true
end
