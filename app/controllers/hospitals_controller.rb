class HospitalsController < ApplicationController

  def index
   # @location = Location.find(params[:location])
   # @hospitals = Hospital.where(location_id: params[:location])
    if params[:search]
      @hospitals = Hospital.search(params[:search])
    else
      @location = Location.find(params[:location_id])
      @hospitals = Hospital.where(location_id: params[:location_id])
    end
  end
end
