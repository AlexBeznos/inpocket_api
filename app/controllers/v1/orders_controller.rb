module V1
  class OrdersController < ApplicationController
    before_action :find_place

    def index
      @orders = Order.includes(order_menu_items: :menu_item)
                     .where(place_id: params[:place_id], user: current_user)
                     .with_menu_items
                     .paginated(params)
    end

    def create
      @order = OrderService.new(order_params)
      @order.place = @place
      @order.user = current_user

      if @order.valid?
        @order.save
        head :ok
      else
        record_invalid @order.errors
      end
    end

    private

    def order_params
      params.require(:order).permit(
        :qr, :lat, :lng, goods: [:type, :id], uuids: []
      )
    end

    def find_place
      @place = Place.find(params[:place_id])
    end
  end
end
