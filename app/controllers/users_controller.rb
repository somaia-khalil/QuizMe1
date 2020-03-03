class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end

  def show
        @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

      if @user.valid?
        @user.save
        redirect_to @user
      else
        redirect_to new_user_path
      end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :nick_name, :password , :password_confirmation)
  end

end
