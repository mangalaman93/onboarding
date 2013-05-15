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

class Task < ActiveRecord::Base
  attr_accessible :creator_id, :invitation_sentdate, :owner_confirmed, :owner_id, :plan_id, :title

  has_many :item
  belongs_to :plan
end
