module V1
  class DeviceAuthController < ApplicationController
    skip_before_action :authenticate!

    def create
      @auth = DeviceAuthService.new(auth_params)

      unless @auth.save
        record_invalid @auth.errors
      end
    end

    private

    def auth_params
      params.require(:device).permit(:platform, :push_token, :uniq_id)
    end
  end
end
