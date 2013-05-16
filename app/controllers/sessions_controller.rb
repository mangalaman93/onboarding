class SessionsController < ApplicationController
  def new
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
end
