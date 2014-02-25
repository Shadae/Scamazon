class UsersController < ApplicationController
  before_action :set_user, except: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    if current_user.present?
    else
      redirect_to '/sessions/new', notice: "Please login."
    end 
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    @user.user_name.downcase!


    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end


private
  def set_user
    @user = current_user
  end

  def user_params 
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
