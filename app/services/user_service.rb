class UserService
  class << self
    def user_auth(email)
      UserClient.post_data('/api/v1/users', { 'email': email })
    end
  end
end
