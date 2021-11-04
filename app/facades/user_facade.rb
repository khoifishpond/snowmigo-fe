class UserFacade
  class << self

    def user_auth(email)
      user = UserService.user_auth(email)
      UserPoro.new(user)
    end
  end
end
