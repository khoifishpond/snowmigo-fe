class TripPoro
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :resort_name, :riders

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @start_date = data[:attributes][:start_date]
    @end_date = data[:attributes][:end_date]
    # @riders = data[:relationships][:riders]
    @resort_id = data[:attributes][:resort_id]
    @resort_name = data[:attributes][:resort_name]
  end
end
