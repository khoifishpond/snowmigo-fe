class UsersController < ApplicationController

  def show
# require "pry"; binding.pry
    @user = UserFacade.user_get(params[:id])
  end
end
