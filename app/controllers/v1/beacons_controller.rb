module V1
  class BeaconsController < ApplicationController
    def index
      @beacons = Place.find(params[:place_id]).beacons

      render json: @beacons
    end
  end
end
