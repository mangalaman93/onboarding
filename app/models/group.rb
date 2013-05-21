class Group < ActiveRecord::Base
  attr_accessible :no_users

  has_and_belongs_to_many :users
  validates :no_users, :presence => true
end
