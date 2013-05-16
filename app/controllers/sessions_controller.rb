class SessionsController < ApplicationController
	before_filter :redirect_to_home, :only => [:new]
	before_filter :correct_user, :only => [:new]

  def new
  	@user = current_user
    @contact_active = "active"
  end

  def create
  	user = User.authenticate(params[:session][:email],
  							 params[:session][:password])
  	if user.nil?
  		flash[:type] = "error"
  		flash.now[:message] = "Invalid email/password combination"
  		render new_session_path
  	else
  		sign_in user
  		redirect_to user
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

  def redirect_to_home
  	if signed_in?
  		redirect_to user_path(current_user)
  	end
  end
end
