# == Schema Information
#
# Table name: suggestions
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  suggestion_data :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class SuggestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
