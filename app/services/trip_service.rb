class TripService
  class << self
    def create_trip(trip_params)
      SnowmigoClient.post_data('/api/v1/trips', trip_params)
    end

    def trip_get(id)
      SnowmigoClient.fetch("/api/v1/trips/#{id}")
    end

    def update_trip(id, updated_attributes)
      SnowmigoClient.patch_data("/api/v1/trips/#{id}", updated_attributes)
    end

    def destroy_trip(id)
      SnowmigoClient.destroy_data("/api/v1/trips/#{id}")
    end

    def create_resort_option(option_params)
      SnowmigoClient.post_data("/api/v1/resort_options", option_params)
    end
  end
end
