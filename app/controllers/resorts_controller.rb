class ResortsController < ApplicationController
  def index
    @resorts = (ResortFacade.resorts_by_state(params[:state]) if params[:state].present?)
  end

  def show
    @resort = ResortFacade.resort_by_id(params[:id])
  end
end
