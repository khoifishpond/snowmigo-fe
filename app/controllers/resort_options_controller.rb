class ResortOptionsController < ApplicationController
  def create
    option_params = { trip_id: params[:trip_id],
                      resort_id: params[:resort_id],
                      resort_name: params[:name]}
    TripFacade.create_resort_option(option_params)
    redirect_to trip_path(params[:trip_id])
  end
end
