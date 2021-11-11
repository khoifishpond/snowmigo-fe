class TripFacade
  class << self
    def create_trip(trip_params)
      trip = TripService.create_trip(trip_params)
      Trip.new(trip)
    end

    def trip_get(id)
      trip = TripService.trip_get(id)
      Trip.new(trip)
    end

    def update_trip(id, updated_attributes)
      trip = TripService.update_trip(id, updated_attributes)
      Trip.new(trip)
    end

    def destroy_trip(id)
      TripService.destroy_trip(id)
    end

    def create_resort_option(option_params)
      TripService.create_resort_option(option_params)
    end

    def vote(trip_id, user_id)
      TripService.vote(trip_id, user_id)
    end

    def create_rider(rider_params)
      rider = TripService.create_rider(rider_params)
      Rider.new(rider)
    end
  end
end
