class InvitationsController < ApplicationController
  before_filter :authenticate, :only => [:new]
  before_filter :only => [:new]  do |controller|
    controller.correct_user(current_user.id)
  end
  # before_filter :only => [:new] do |controller|
  #   controller.admin_only_access(current_user)
  # end

  def new
  	@invite = Invitation.new
  end

  def create
  	@invite = Invitation.new(params[:invite])
    @invite.from_id = current_user.id
    @invite.guid = SecureRandom.uuid
    if @invite.save
    	# Tell the UserMailer to send a welcome Email after save
      @user = User.find_by_id(params[:to_id])
      @url = "localhost:3000/signup?guid=#{@invite.guid}&email=#{@user.email}"
      UserMailer.welcome_email.deliver
      redirect_to new_invitation_path, :message => "Invitation successfully sent!"
    else
      render new_invitation_path
    end        
  end

  def confirm
  end

  def admin_only_access(user_id)
    debugger
    redirect_to user_path(user_id) unless current_user.is_admin
  end
end
