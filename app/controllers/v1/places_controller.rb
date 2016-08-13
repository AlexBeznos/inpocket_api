module V1
  class PlacesController < ApplicationController
    def index
      @places = Place.all

      respond_with @places
    end

    def show
      @place = Place.find(params[:id])

      respond_with @place
    end
  end
end
