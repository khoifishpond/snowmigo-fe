class TripsController < ApplicationController

  def new

  end

  def create
    @trip = TripFacade.create_trip(trip_params)
    redirect_to trip_path(@trip.id)
  end

  def show
    @trip = TripFacade.trip_get(params[:id])
  end

  private

  def trip_params
    {
      name: params[:name],
      start_date: params[:start_date],
      end_date: params[:end_date],
      resort_id: params[:resort_id]
    }
  end
end
