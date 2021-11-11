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

    def destroy_trip(id)
      SnowmigoClient.destroy_data("/api/v1/trips/#{id}")
    end

    def create_resort_option(option_params)
      SnowmigoClient.post_data("/api/v1/resort_options", option_params)[:data]
    end

    def vote(trip_id, vote_params)
      SnowmigoClient.patch_data("/api/v1/trips/#{trip_id}/vote", vote_params)
    end

    def create_rider(rider_params)
      SnowmigoClient.post_data('/api/v1/riders', rider_params)[:data]
    end
  end
end
