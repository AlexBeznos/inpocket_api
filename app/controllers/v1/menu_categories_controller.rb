module V1
  class MenuCategoriesController < ApplicationController
    def index
      @categories = MenuCategory.where(place_id: params[:place_id])
    end
  end
end
