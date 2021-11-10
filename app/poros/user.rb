class User
  attr_reader :email, :name, :id, :address, :ski_pass, :ski_or_board, :exp_level, :emergency_name, :emergency_number, :trips, :friends

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
    @trips.map do |trip|
      Trip.new(trip) if trip.end_date < Date.today
    end
  end

  def upcoming_trips
    @trip.map do |trip|
      Trip.new(trip) if trip.end_date >= Date.today
    end
  end

  def get_friend
    @friends.map do |friend|
      Friend.new(friend)
    end
  end
end
