class FriendshipFacade
  def self.get_friend(params)
    friendship = FriendshipService.friendship_by_email(params)
    Friend.new(friendship)
  end
end
