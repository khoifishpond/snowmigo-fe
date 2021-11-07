class ResortService
  class << self
    def resorts_by_state(state)
      SnowmigoClient.fetch("/api/v1/resorts?states=#{state}")
    end
  end
end
