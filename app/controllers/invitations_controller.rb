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
    @invite = Invitation.new(params[:invitation])
    @invite.from_id = current_user.id
    @invite.guid = SecureRandom.uuid

    if Rails.env.development?
      host = "localhost:3000"
    else
      host = "onboarding.herokuapp.com"
    end

    if @invite.save
      # Tell the UserMailer to send a welcome Email after 
      user_email = params[:invitation][:to_email]
      url = "#{host}/signup?guid=#{@invite.guid}&email=#{user_email}"
      UserMailer.welcome_email(user_email, url).deliver
      redirect_to new_invitation_path, :message => "Invitation successfully sent!"
    else
      # raise @invite.errors.full_messages.to_s
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
