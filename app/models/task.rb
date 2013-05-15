class Task < ActiveRecord::Base
  attr_accessible :creator_id, :invitation_sentdate, :owner_confirmed, :owner_id, :plan_id, :title
end
