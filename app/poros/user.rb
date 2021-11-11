class User
  attr_reader :email, :name, :id, :address, :ski_pass, :ski_or_board, :exp_level, :emergency_name, :emergency_number, :trips, :friends

  def initialize(params)
    @id = params[:id]
    @name = params[:attributes][:name]
    @email = params[:attributes][:email]
    @address = params[:attributes][:address]
    @ski_pass = params[:attributes][:ski_pass]
    @ski_or_board = params[:attributes][:ski_or_board]
    @exp_level = params[:attributes][:exp_level]
    @emergency_name = params[:attributes][:emergency_name]
    @emergency_number = params[:attributes][:emergency_number]
    @trips = params[:attributes][:trips]
    @friends = params[:attributes][:friends]
  end

  def past_trips
    @trips.filter_map do |trip|
      trip if Date.parse(trip[:data][:attributes][:end_date]).past?
    end
  end

  def upcoming_trips
    @trips.filter_map do |trip|
      # binding.pry
      trip if Date.parse(trip[:data][:attributes][:end_date]) >= Date.today || !trip[:data][:attributes][:end_date].nil?
    end
  end
end
