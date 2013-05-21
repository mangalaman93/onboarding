class SessionsController < ApplicationController
	before_filter :redirect_to_home, :only => [:new]
  before_filter :redirect_to_unsigned_home, :only => [:destroy]

  def new
  	@user = current_user
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
      flash[:type] = "info"
      flash[:message] = "Please login to access this page!"
  		redirect_to user_path(current_user)
  	end
  end

  def redirect_to_unsigned_home
    if !signed_in?
      flash[:type] = "info"
      flash[:message] = "Please login to access this page!"
      redirect_to home_path
    end
  end
end
