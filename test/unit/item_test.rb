# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  type_of     :string(255)
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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
