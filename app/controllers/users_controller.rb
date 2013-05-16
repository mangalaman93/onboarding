class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :show]
  before_filter :correct_user, :only => [:edit, :show]

  def index
    @users = User.all
  end

  def edit
    @profile_active = "active"
    @user = User.find(params[:id])
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(params[:user])
  #     redirect_to user_path(@user)
  #   else
  #    render 'edit'
  #   end
  # end

  # def destroy
  #   (User.find(params[:id])).destroy
  #   redirect_to :action => "index"
  # end

  def new
    @user = User.new
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @home_active = "active"
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  private
  def authenticate
    deny_access unless signed_in?
  end
end
