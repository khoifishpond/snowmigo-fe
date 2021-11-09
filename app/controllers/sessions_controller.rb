class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = UserFacade.user_auth(access_token[:info][:email], access_token[:info][:name])
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
