class User
  attr_reader :email, :name, :id, :address, :ski_pass, :ski_or_board,
              :exp_level, :emergency_name, :emergency_number, :trips

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
    @trips = data[:attributes][:trips]
    @friends = data[:attributes][:friends]
  end

  def past_trips
    @trips.filter_map do |trip|
      trip if trip[:data][:attributes][:end_date].to_date < Date.today
    end
  end

  def upcoming_trips
    @trips.filter_map do |trip|
      trip if trip[:data][:attributes][:end_date].to_date >= Date.today
    end
  end

  def friends_to_add(riders)
    @friends.filter_map do |friend|
      [friend[:data][:attributes][:friend_name], friend[:data][:attributes][:friend_id]] if !riders.include?(friend[:data][:attributes][:friend_id])
    end
  end
end
