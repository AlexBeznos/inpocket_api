module V1
  class PlacesController < ApplicationController
    def index
      @places = Place.includes(:photos, :category_record)
                     .filter(params.slice(:uuid, :category_id))
                     .paginated(params)
                     .decorate

      respond_with @places
    end

    def show
      @place = Place.includes(:photos)
                    .find(params[:id])
                    .decorate

      respond_with @place
    end
  end
end
