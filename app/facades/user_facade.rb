class UserFacade
  class << self

    def user_auth(email, name)
      user = UserService.user_auth(email, name)
      UserPoro.new(user)
    end

    def user_get(id)
      user = UserService.user_get(id)
      UserPoro.new(user)
    end
  end
end
