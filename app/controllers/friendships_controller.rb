class FriendshipsController < ApplicationController
  def create
    friendship = FriendshipFacade.get_friend(friendship_params)
    redirect_to user_path(current_user.id)
  end

  private

  def friendship_params
    {
      email: params[:email],
      user_id: current_user.id
    }
  end
end
