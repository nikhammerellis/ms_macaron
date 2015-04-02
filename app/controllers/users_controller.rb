class UsersController < ApplicationController
  before_action :authorize, only: [:index, :edit, :destroy]

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = 'Registration Successful!'
      redirect_to '/' 
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to users_index_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :id)
  end
end
