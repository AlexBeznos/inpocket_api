module V1
  class DeviceAuthController < ApplicationController

    def create
      @auth = DeviceAuthService.new(sign_in_params)

      if @auth.save
        render json: @auth
      else
        record_invalid @auth.errors
      end
    end

    private

    def sign_in_params
      params.require(:device).permit(:platform, :push_token)
    end
  end
end
