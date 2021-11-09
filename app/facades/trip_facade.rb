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
  end
end
