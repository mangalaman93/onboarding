# == Schema Information
#
# Table name: item_templates
#
#  id               :integer          not null, primary key
#  type             :string(255)
#  description      :string(255)
#  duration         :integer
#  comments         :string(255)
#  metadata         :text
#  task_template_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ItemTemplate < ActiveRecord::Base
  attr_accessible :comments, :description, :duration, :metadata, :task_template_id, :type

  belongs_to :task_template
end
