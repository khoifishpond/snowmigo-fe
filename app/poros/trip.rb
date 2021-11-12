class Trip
  attr_reader :id, :start_date, :end_date, :resort_id, :name, :options, :vote_status, :riders

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @start_date = info[:attributes][:start_date]
    @end_date = info[:attributes][:end_date]
    @vote_status = info[:attributes][:vote_status]
    @resort_id = info[:attributes][:resort_id]
    @riders = info[:attributes][:riders]
    @options = info[:attributes][:resort_options]
  end

  def format_start_date
    @start_date.to_date.strftime('%b %-d, %Y')
  end

  def format_end_date
    @end_date.to_date.strftime('%b %-d, %Y')
  end

  def added_friends
    @riders.map do |rider|
      rider[:data][:attributes][:user_id]
    end
  end

  def host?(user_id)
    @riders.any? do |rider|
      rider[:data][:attributes][:user_id].to_s == user_id
    end
  end

  def user_vote(user_id)
    @riders.filter_map do |rider|
      rider[:data][:attributes][:vote]
    end.first
  end
end
