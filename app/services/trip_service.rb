class TripService
  class << self

    def create_trip(trip_params)
      SnowmigoClient.post_data('/api/v1/trips', trip_params)[:data]
    end

    def trip_get(id)
      SnowmigoClient.fetch("/api/v1/trips/#{id}")[:data]
    end
  end
end
