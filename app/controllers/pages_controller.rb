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
  end
end
