module V1
  class PlacesController < ApplicationController
    def index # TODO: make this much better
      @places = if params[:uuid]
        Place.joins(:beacons).where("beacons.uuid in (?)", params[:uuid])
      else
        Place.all
      end

      respond_with @places
    end

    def show
      @place = Place.find(params[:id])

      respond_with @place
    end
  end
end
