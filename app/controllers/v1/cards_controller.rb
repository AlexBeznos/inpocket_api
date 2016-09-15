module V1
  class CardsController < ApplicationController

    def index
      @cards = current_user.user_scores.includes(:place).paginated(params)

      respond_with @cards
    end
  end
end
