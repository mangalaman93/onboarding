class Plan < ActiveRecord::Base
  attr_accessible :bu_id, :creator_id, :end_date, :hr_id, :manager_id, :mentor_id, :start_date, :title, :user_id
end
