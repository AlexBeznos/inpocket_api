module V1
  class BeaconsController < ApplicationController

    def index
      @beacons = Beacon.filter(params.slice(:place_id))

      respond_with @beacons
    end
  end
end
