module V1
  class PlaceCategoriesController < ApplicationController
    def index
      @categories = PlaceCategory.all
    end
  end
end
