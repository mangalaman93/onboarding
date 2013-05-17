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
  attr_accessible :content, :from_id, :guid, :is_confirmed, :sent_date, :to_email

  belongs_to :user, :foreign_key => :id

  email_regex = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/

  validates :from_id, :presence => true

  validates :to_email,
  			:format => { :with => email_regex, :message => "Email is not in proper format" },
    		:presence => true
end
