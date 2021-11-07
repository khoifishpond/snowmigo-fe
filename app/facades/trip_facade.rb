class TripFacade
  class << self
    def create_trip(trip_params)
      trip = TripService.create_trip(trip_params)
      TripPoro.new(trip)
    end

    def trip_get(id)
      trip = TripService.trip_get(id)
      TripPoro.new(trip)
    end
  end
end
