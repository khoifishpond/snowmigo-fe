class Trip
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :resort_options, :vote_status, :riders

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @start_date = info[:attributes][:start_date]
    @end_date = info[:attributes][:end_date]
    @resort_id = info[:attributes][:resort_id]
    @resort_name = info[:attributes][:resort_name]
    # @riders = info[:riders]
    @options = info[:attributes][:resort_options]
  end

  def format_start_date
    @start_date.to_date.strftime('%b %-d, %Y')
  end

  def format_end_date
    @end_date.to_date.strftime('%b %-d, %Y')
  end
end
