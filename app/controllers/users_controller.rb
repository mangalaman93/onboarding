class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      @user.date_of_birth = params[:user][:date_of_birth]
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
     render 'edit'
    end
  end

  def destroy
    (User.find(params[:id])).destroy
    redirect_to :action => "index"
  end

  def new
    @user = User.new
    if params[:user]
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      @user.date_of_birth = params[:user][:date_of_birth]
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
