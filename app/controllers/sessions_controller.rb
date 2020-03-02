class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = User.try(:authenticate, params[:user][:password])
    if user 
      session[:user_id] = user.id
      @user = user
      redirect_to '/user/welcome'
    else 
      redirect_to '/sessions/new'
    end
  end

  
end
