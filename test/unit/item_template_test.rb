# == Schema Information
#
# Table name: item_templates
#
#  id               :integer          not null, primary key
#  type_of          :string(255)
#  description      :string(255)
#  duration         :integer
#  comments         :string(255)
#  metadata         :text
#  task_template_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ItemTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
