class MessagesController < ApplicationController
	before_filter :authenticate
  before_filter :only => [:edit, :show]  do |controller|
    controller.correct_user(params[:id])
  end

	def index
		@inbox_active = "active"
		@users = (User.all)
		@users.delete(current_user)
		@message = Message.new
		id = current_user.id

		all_groups = GroupsUser.where(user_id: 1).order("updated_at DESC")
	end

	def create
		to_user_id = params[:message][:group_id]
		from_user_id = current_user.id
		body = params[:message][:body]

		if GroupsUser.where(user_id: [from_user_id, to_user_id]).nil?
			group = Group.create!(:no_users => 2)
			GroupsUser.create!(:group_id => group, :user_id => to_user_id)
			GroupsUser.create!(:group_id => group, :user_id => from_user_id)
		else
			group = Group.find(GroupsUser.where(user_id: [to_user_id, from_user_id])[0].group_id)
			if group.nil?
				raise "error occured!"
			end
		end

		Message.new(sender_id: from_user_id, group_id: group.id, body: body).save
	end

	private

end
