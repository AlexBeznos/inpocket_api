module V1
  class SharesController < ApplicationController
    def index
      @shares = Share.filter(params.slice(:place_id))
                     .paginated(params)

      respond_with @shares
    end
  end
end
