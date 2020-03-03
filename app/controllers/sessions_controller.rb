class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

  def new
    # @user = User.new
  end

  def create
    @user = User.find_by(nick_name: params[:nick_name])
    # user = User.try(:authenticate, params[:user][:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  
end
