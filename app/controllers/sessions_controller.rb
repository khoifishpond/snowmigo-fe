class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = UserFacade.user_auth(access_token[:info][:email], access_token[:info][:name])
    session[:user_id] = user.id
    unless user.nil?
      flash[:success] = 'Login Successful'
      redirect_to user_path(user.id)
    end
  end

  def destroy
    session.clear
    if current_user.nil?
      flash[:success] = 'Logout successful'
      redirect_to root_path
    end
  end
end
