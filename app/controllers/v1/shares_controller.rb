module V1
  class SharesController < ApplicationController
    def index
      @shares = Place.find(params[:place_id]).shares

      render json: @shares
    end
  end
end
