class Message < ActiveRecord::Base
  attr_accessible :body, :group_id, :sender_id, :thread_id

  belongs_to :users
  has_and_belongs_to_many :groups, :foreign_key => "group_id"

  validates :body, :presence => true
  validates :sender_id, :presence => true
  validates :group_id, :presence => true
end
