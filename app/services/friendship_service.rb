class FriendshipService
  def friendship_by_email(params)
    SnowmigoClient.post_data("/api/v1/friendships", params)
  end
end
