module V1
  class SharesController < ApplicationController
    def index
      @shares = Place.find(params[:place_id]).shares.paginated(params)

      respond_with @shares
    end
  end
end
