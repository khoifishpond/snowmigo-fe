class TripService
  class << self

    def create_trip(trip_params)
      SnowmigoClient.post_data('/api/v1/trips', trip_params)[:data]
    end

    def trip_get(id)
      SnowmigoClient.fetch("/api/v1/trips/#{id}")[:data]
    end

    def update_trip(id, updated_attributes)
      SnowmigoClient.patch_data("/api/v1/trips/#{id}", updated_attributes)[:data]
    end

    # def destroy_trip(id)
    #   SnowmigoClient.destroy_data("/api/v1/trips/#{id}")
    # end
  end
end
