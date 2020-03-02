class UsersController < ApplicationController

  
  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :nick_name, :password_digest)
  end

end
