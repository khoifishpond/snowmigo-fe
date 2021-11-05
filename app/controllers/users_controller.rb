class UsersController < ApplicationController

  def show
    @user = UserFacade.user_get(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    UserFacade.user_update(current_user.id, updated_attributes)
    redirect_to user_path(current_user.id)
  end

  private

  def updated_attributes
   {
    name: params[:name],
    address: params[:address],
    pass_type: params[:pass_type],
    ski_or_board: params[:ski_or_board],
    xp_level: params[:xp_level],
    emergency_name: params[:emergency_name],
    emergency_number: params[:emergency_number]
    }
  end
end
