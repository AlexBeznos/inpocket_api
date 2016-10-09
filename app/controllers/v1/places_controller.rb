module V1
  class PlacesController < ApplicationController
    def index
      @places = Place.includes(:photos, :category_record)
                     .filter(params.slice(:uuid, :category_id, :places_exclusion))
                     .paginated(params)
                     .decorate
    end

    def show
      @place = Place.includes(:photos)
                    .find(params[:id])
                    .decorate
    end
  end
end
