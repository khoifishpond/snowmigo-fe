class UserPoro
  attr_reader :email, :name, :id, :address, :ski_pass, :ski_or_board, :exp_level, :emergency_name, :emergency_number

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @address = data[:attributes][:address]
    @ski_pass = data[:attributes][:ski_pass]
    @ski_or_board = data[:attributes][:ski_or_board]
    @exp_level = data[:attributes][:exp_level]
    @emergency_name = data[:attributes][:emergency_name]
    @emergency_number = data[:attributes][:emergency_number]
  end
end
