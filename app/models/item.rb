# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  description :string(255)
#  duration    :integer
#  user_id     :integer
#  due_date    :datetime
#  comments    :text
#  metadata    :text
#  task_id     :integer
#  is_done     :boolean
#  is_vetoed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :comments, :description, :due_date, :duration, :is_done, :is_vetoed, :metadata, :task_id, :type, :user_id

  belongs_to :task
end
