class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :show]
  before_filter :only => [:edit, :show]  do |controller|
    controller.correct_user(params[:id])
  end

  # def index
  #   @users = User.all
  # end

  def edit
    @profile_active = "active"
    @user = User.find(params[:id])
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      @user.date_of_birth = params[:user][:date_of_birth]
    end
    @button_name = "Update"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), :flash => {:type => "success", :message => "Profile is successfully updated!" }
    else
      flash[:type] = "error"
      flash[:message] = "Error in updating the profile!"
      @profile_active = "active"
      @button_name = "Update"
      render 'edit'
    end
  end

  # def destroy
  #   (User.find(params[:id])).destroy
  #   redirect_to :action => "index"
  # end

  def new
    email = params[:email]
    uuid = params[:guid]
    invite = Invitation.find_by_guid(uuid)
    redirect_to(user_path(current_user),
                          :flash => {:type => "info",
                                     :message => "You are not allowed to access this page" }) and return unless current_user.nil?
    redirect_to(root_path,
                :flash => { :type => "error",
                            :message => "Sorry, invalid link!" }) and return unless !invite.nil?
    redirect_to(root_path,
                :flash => {:type => "error",
                           :message => "Sorry! invlid link." }) and return unless (email == invite.to_email && !invite.is_confirmed)
    @user = User.new
    @user.email = email
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      @user.date_of_birth = params[:user][:date_of_birth]
    end
    @button_name = "Sign Up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or user_path(@user)
    else
      flash[:type] = "error"
      flash[:message] = "Error occurred! Please fill proper information."
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @home_active = "active"    
  end
end
