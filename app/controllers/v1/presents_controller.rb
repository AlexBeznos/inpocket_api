module V1
  class PresentsController < ApplicationController
    def index
      @presents = Place.find(params[:place_id]).presents

      respond_with @presents
    end
  end
end
