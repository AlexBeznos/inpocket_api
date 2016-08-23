module V1
  class PlacesController < ApplicationController
    def index
      @places = Place.filter(params.slice(:uuid))
                     .paginated(params)

      respond_with @places
    end

    def show
      @place = Place.find(params[:id]).decorate

      respond_with @place
    end
  end
end
