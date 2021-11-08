class TripPoro
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :resort_name

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @start_date = data[:attributes][:start_date]
    @end_date = data[:attributes][:end_date]
    # @riders = data[:relationships][:riders]
    @resort_id = data[:attributes][:resort_id]
    @resort_name = data[:attributes][:resort_name]
  end

  def format_start_date
    @start_date.to_date.strftime('%b %-d, %Y')
  end

  def format_end_date
    @end_date.to_date.strftime('%b %-d, %Y')
  end
end
