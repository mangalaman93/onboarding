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
  attr_accessor :selected_task_templates
  attr_accessible :bu_id, :creator_id, :end_date, :hr_id, :manager_id, :mentor_id, :start_date, :title, :user_id

  has_many :tasks, dependent: :destroy
  belongs_to :user
  
  def completion_status
    done_count = 0
    total_count = 0
    
    tasks.each do |each_task|
      each_task.items do |each_item|
        total_count = total_count + 1
        if each_item.is_done?  
          done_count = done_count + 1
        end
      end 
    end
    
    "(" + done_count.to_s + "/" + total_count.to_s + ")"
        
  end
  
  def user
    User.find(user_id)
  end
end
