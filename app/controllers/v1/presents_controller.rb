module V1
  class PresentsController < ApplicationController
    def index
      @presents = Present.filter(params.slice(:place_id))
                         .without_debut
                         .paginated(params)

      respond_with @presents
    end

    def show
      @present = Present.filter(params.slice(:place_id))
                        .find(params[:id])

      respond_with @present
    end
  end
end
