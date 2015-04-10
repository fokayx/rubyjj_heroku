class SearchsController < ApplicationController

  def index
    unless 
      @hospitals = Hospital.all
    else params[:search]
      @hospitals = Hospital.search(params[:search])
    end
  end

end
