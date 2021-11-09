class UserFacade
  class << self

    def user_auth(email, name)
      user = UserService.user_auth(email, name)
      User.new(user)
    end

    def user_get(id)
      user = UserService.user_get(id)
      User.new(user)
    end

    def user_update(id, updated_attributes)
      user = UserService.user_update(id, updated_attributes)
      User.new(user)
    end
  end
end
