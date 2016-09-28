module V1
  class PlaceCategoriesController < ApplicationController
    def index
      @categories = PlaceCategory.all

      respond_with @categories
    end
  end
end
