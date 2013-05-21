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

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
