module V1
  class OrdersController < ApplicationController
    before_action :find_place

    def create
      @order = OrderService.new(order_params)
      @order.place = @place

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
