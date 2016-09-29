module V1
  class DebutPresentsController < ApplicationController
    def show
      @present = Present.filter(params.slice(:place_id))
                        .find_by(debut: true)

      respond_with @present
    end
  end
end
