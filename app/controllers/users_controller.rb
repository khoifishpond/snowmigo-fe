class UsersController < ApplicationController

  def show
    @user = UserFacade.user_get(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    user = UserFacade.user_update(current_user.id, updated_attributes)
    redirect_to user_path(current_user.id)
  end

  private

  def updated_attributes
   {
    name: params[:name],
    address: params[:address],
    ski_pass: params[:ski_pass],
    ski_or_board: params[:ski_or_board],
    exp_level: params[:exp_level],
    emergency_name: params[:emergency_name],
    emergency_number: params[:emergency_number]
    }
  end
end
