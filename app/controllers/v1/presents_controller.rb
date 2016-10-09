module V1
  class PresentsController < ApplicationController
    def index
      @presents = Present.filter(params.slice(:place_id, :places_exclusion))
                         .without_debut
                         .paginated(params)
    end

    def show
      @present = Present.filter(params.slice(:place_id))
                        .find(params[:id])
    end
  end
end
