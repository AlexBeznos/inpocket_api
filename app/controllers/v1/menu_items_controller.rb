module V1
  class MenuItemsController < ApplicationController
    def index
      @items = MenuItem.includes(menu_category: :place)
                       .filter(params.slice(:menu_category_id, :day_item, :place_id))
                       .paginated(params)
                       .decorate
    end

    def show
      @item = MenuItem.includes(menu_category: :place)
                      .find(params[:id])
                      .decorate
    end
  end
end
