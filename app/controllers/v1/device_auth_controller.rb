module V1
  class DeviceAuthController < ApplicationController
    skip_before_action :authenticate!

    def create
      @auth = DeviceAuthService.new(auth_params)

      if @auth.save
        respond_with @auth.device
      else
        record_invalid @auth.errors
      end
    end

    private

    def auth_params
      params.require(:device).permit(:platform, :push_token, :uniq_id)
    end
  end
end
