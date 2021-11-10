class UserService
  class << self
    def user_auth(email, name)
      SnowmigoClient.post_data('/api/v1/users',
                               { 'email': email, 'name': name })[:data]
    end

    def user_get(id)
      SnowmigoClient.fetch("/api/v1/users/#{id}")[:data]
    end

    def user_update(id, updated_attributes)
      SnowmigoClient.patch_data("/api/v1/users/#{id}", updated_attributes)[:data]
    end
  end
end