class Item < ActiveRecord::Base
  attr_accessible :comments, :description, :due_date, :duration, :is_done, :is_vetoed, :metadata, :task_id, :type, :user_id
end
