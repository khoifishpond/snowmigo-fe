class ResortService
  class << self
    def resorts_by_state(state)
      SnowmigoClient.fetch("/api/v1/resorts?states=#{state}")
    end

    def resort_by_id(id)
      SnowmigoClient.fetch("/api/v1/resorts/#{id}")
    end
  end
end
