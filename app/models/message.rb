class Message < ActiveRecord::Base
  attr_accessible :body, :group_id, :sender_id, :thread_id

  belongs_to :users

  validates :body, :presence => true
  validates :sender_id, :presence => true
  validates :group_id, :presence => true
end
