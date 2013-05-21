# == Schema Information
#
# Table name: tasks
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  creator_id          :integer
#  owner_id            :integer
#  invitation_sentdate :datetime
#  owner_confirmed     :boolean
#  plan_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
