module V1
  class MenuItemsController < ApplicationController
    def index
      @items = MenuItem.filter(params.slice(:menu_category_id, :day_item, :place_id))
                       .paginated(params)
    end

    def show
      @item = MenuItem.find(params[:id])
    end
  end
end
