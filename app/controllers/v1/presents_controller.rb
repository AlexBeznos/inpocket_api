module V1
  class PresentsController < ApplicationController
    def index
      @presents = Place.find(params[:place_id]).presents

      render json: @presents
    end
  end
end
