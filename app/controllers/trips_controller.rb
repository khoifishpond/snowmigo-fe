class TripsController < ApplicationController
  def new; end

  def create
    @trip = TripFacade.create_trip(trip_params)
    redirect_to trip_path(@trip.id)
  end

  def show
    @trip = TripFacade.trip_get(params[:id])
  end
  
  def edit
    @trip = TripFacade.trip_get(params[:id])
  end

  def update
    trip = TripFacade.update_trip(params[:id], trip_params)
    redirect_to trip_path(trip.id)
  end

  def destroy
    TripFacade.destroy_trip(params[:id])
    redirect_to user_path(current_user.id)
  end

  private

  def trip_params
    {
      name: params[:name],
      start_date: params[:start_date],
      end_date: params[:end_date],
      resort_id: params[:resort_id],
      resort_name: params[:resort_name]
    }
  end
end
