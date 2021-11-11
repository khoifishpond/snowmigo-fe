class Trips::RidersController < ApplicationController
  def create
    rider_params = {
      user_id: params[:user_id],
      trip_id: params[:trip_id],
      host: params[:host],
      driver: params[:driver],
      budget: params[:budget]
    }
    TripFacade.create_rider(rider_params)
    redirect_to trip_path(params[:trip_id])
  end
end
