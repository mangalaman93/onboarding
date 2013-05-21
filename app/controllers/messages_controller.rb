class MessagesController < ApplicationController
	before_filter :authenticate
  before_filter :only => [:edit, :show]  do |controller|
    controller.correct_user(params[:id])
  end

	def index
		@users = User.all
		@message = Message.new
		id = current_user.id
		Group.where("user_id = ?", id).order("updated_at DESC").only(:group_id)
	end

	def create
	end
end
