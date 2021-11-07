class ResortsController < ApplicationController
  def index
    if params[:state].present?
      @resorts = ResortFacade.resorts_by_state(params[:state])
    else
      @resorts = nil
    end
  end

  def show
  end
end
