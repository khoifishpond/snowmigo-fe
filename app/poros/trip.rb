class Trip
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :resort_name,
              :options

  def initialize(info)
    @id = info[:data][:id]
    @name = info[:data][:attributes][:name]
    @start_date = info[:data][:attributes][:start_date]
    @end_date = info[:data][:attributes][:end_date]
    # @riders = info[:data][:relationships][:riders]
    @resort_id = info[:data][:attributes][:resort_id]
    @resort_name = info[:data][:attributes][:resort_name]
    @option_info = info[:included]
  end

  def format_start_date
    @start_date.to_date.strftime('%b %-d, %Y')
  end

  def format_end_date
    @end_date.to_date.strftime('%b %-d, %Y')
  end

  def options
    @option_info.map do |option|
      option[:attributes]
    end
  end
end
