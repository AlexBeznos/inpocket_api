module V1
  class SharesController < ApplicationController
    def index
      @shares = Share.filter(params.slice(:place_id, :places_exclusion))
                     .paginated(params)
    end
  end
end
