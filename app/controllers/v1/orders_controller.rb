module V1
  class OrdersController < ApplicationController
    def create
      @order = OrderService.new(order_params)

      if @order.valid?
        @order.save
        respond_with @order
      else
        render_errors @order
      end
    end

    private

    def order_params
      params.require(:order).permit(
        :qr, :uuid, :lat, :lng, goods: [:type, :id]
      )
    end
  end
end
