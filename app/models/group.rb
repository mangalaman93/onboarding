class Group < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  belongs_to :users
  has_and_belongs_to_many :messages, :foreign_key => "group_id"

  validates :group_id, :presence => true
  validates :user_id, :presence => true
end
