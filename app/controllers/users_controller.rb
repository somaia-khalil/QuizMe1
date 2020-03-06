class UsersController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]
  
  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nick_name, :password , :password_confirmation)
  end

end
