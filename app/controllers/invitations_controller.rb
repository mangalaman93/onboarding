class InvitationsController < ApplicationController
  def new
  	@invite = Invitation.new
  end

  def create
  	@invite = Invitation.new(params[:invite])
    if @invite.save
    	# Tell the UserMailer to send a welcome Email after save
      UserMailer.welcome_email().deliver
      redirect_to invitations_new_path
    else
      render invitations_new_path
    end        
  end

  def confirm
  end
end
