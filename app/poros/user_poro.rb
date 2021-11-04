class UserPoro
  attr_reader :email, :name, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
  end
end
