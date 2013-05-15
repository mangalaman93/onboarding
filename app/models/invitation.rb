class Invitation < ActiveRecord::Base
  attr_accessible :content, :from_id, :guid, :is_confirmed, :sent_date, :to_id
end
