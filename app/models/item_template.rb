class ItemTemplate < ActiveRecord::Base
  attr_accessible :comments, :description, :duration, :metadata, :task_template_id, :type
end
