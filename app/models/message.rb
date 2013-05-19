class Message < ActiveRecord::Base
  attr_accessible :body, :group_id, :sender_id, :thread_id
end
