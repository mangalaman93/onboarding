# == Schema Information
#
# Table name: invitations
#
#  id           :integer          not null, primary key
#  from_id      :integer
#  to_id        :integer
#  content      :text
#  guid         :string(255)
#  sent_date    :datetime
#  is_confirmed :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Invitation < ActiveRecord::Base
  attr_accessible :content, :from_id, :guid, :is_confirmed, :sent_date, :to_id
end
