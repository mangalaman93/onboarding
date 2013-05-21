class Group < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  belongs_to :users

  validates :group_id, :presence => true
  validates :user_id, :presence => true
end
