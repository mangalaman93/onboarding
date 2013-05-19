class PagesController < ApplicationController
  def home
    @home_active = "active"
  	if signed_in?
  		redirect_to user_path(current_user)
  	end
  end

  def about
    @about_active = "active"
  end

  def settings
    if !signed_in?
      flash[:type] = "info"
      flash[:message] = "Please login to access the page!"
      redirect_to home_path
    else
      
    end
  end
end
