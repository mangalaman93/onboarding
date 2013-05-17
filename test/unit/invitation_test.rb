# == Schema Information
#
# Table name: invitations
#
#  id           :integer          not null, primary key
#  from_id      :integer
#  to_email     :string(255)
#  content      :text
#  guid         :string(255)
#  sent_date    :datetime         default(2013-05-17 04:57:27 UTC)
#  is_confirmed :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
