module V1
  class BeaconsController < ApplicationController

    def index
      @beacons = Place.find(params[:place_id]).beacons

      respond_with @beacons
    end
  end
end
