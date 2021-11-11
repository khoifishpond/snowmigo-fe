class FriendshipFacade
  def self.get_friend(params)
    friendship = Friendship.friends_by_email(params)
    Friendship.new(friendship)
  end
end
