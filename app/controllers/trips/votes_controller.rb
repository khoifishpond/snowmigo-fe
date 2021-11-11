class Trips::VotesController < ApplicationController
  def update
    vote_params = {
      user_id: params[:user_id],
      resort_id: params[:resort_id]
    }
    TripFacade.vote(params[:trip_id], vote_params)
    redirect_to trip_path(params[:trip_id])
  end
end
