module V1
  class PresentsController < ApplicationController
    def index
      @presents = Present.filter(params.slice(:place_id))
                         .without_debut
                         .paginated(params)

      respond_with @presents
    end

    def show
      @present = if params[:id] == 'debut'
        Present.where(place_id: params[:place_id]).find_by(debut: true)
      else
        Present.find(params[:debut])
      end

      respond_with @present
    end
  end
end
