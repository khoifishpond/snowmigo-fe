class FriendshipsController < ApplicationController
  def create
    require 'pry'; binding.pry
    friend = User.find_by(email: params[:email])
    if friend
      current_user.friendships.create(friend: friend)
    else
      flash[:error] = 'Invalid email. Please try again.'
    end
    
  end
end