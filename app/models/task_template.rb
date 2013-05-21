# == Schema Information
#
# Table name: task_templates
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskTemplate < ActiveRecord::Base
  attr_accessible :title

  has_many :item_template
end
