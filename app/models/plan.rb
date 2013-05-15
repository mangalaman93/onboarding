# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  creator_id :integer
#  start_date :datetime
#  end_date   :datetime
#  hr_id      :integer
#  bu_id      :integer
#  manager_id :integer
#  mentor_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ActiveRecord::Base
  attr_accessible :bu_id, :creator_id, :end_date, :hr_id, :manager_id, :mentor_id, :start_date, :title, :user_id

  has_many :task
  belongs_to :user
end
