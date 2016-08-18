module V1
  class MenuItemsController < ApplicationController
    def index
      @items = MenuItem.where(menu_category_id: params[:menu_category_id])
                       .paginated(params)
    end

    def show
      @item = MenuItem.find(params[:id])
    end
  end
end
