class Trip
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :resort_options, :vote_status, :riders

  def initialize(info)
    @id = info[:data][:id]
    @name = info[:data][:attributes][:name]
    @start_date = info[:data][:attributes][:start_date]
    @end_date = info[:data][:attributes][:end_date]
    @vote_status = info[:data][:attributes][:vote_status]
    @resort_id = info[:data][:attributes][:resort_id]
    @riders = info[:data][:attributes][:riders]
    @resort_options = info[:data][:attributes][:resort_options]
  end

  def format_start_date
    @start_date.to_date.strftime('%b %-d, %Y')
  end

  def format_end_date
    @end_date.to_date.strftime('%b %-d, %Y')
  end
end
