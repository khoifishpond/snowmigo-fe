class User
  attr_reader :email, :name, :id, :address, :ski_pass, :ski_or_board, :exp_level, :emergency_name, :emergency_number

  def initialize(info[:data])
    @id = info[:data][:id]
    @name = info[:data][:attributes][:name]
    @email = info[:data][:attributes][:email]
    @address = info[:data][:attributes][:address]
    @ski_pass = info[:data][:attributes][:ski_pass]
    @ski_or_board = info[:data][:attributes][:ski_or_board]
    @exp_level = info[:data][:attributes][:exp_level]
    @emergency_name = info[:data][:attributes][:emergency_name]
    @emergency_number = info[:data][:attributes][:emergency_number]
    @friend_info = info[:included]
  end

  def friends
    @friend_info.map do |friend|
      friend[:attributes][:name]
    end
  end
end
