module V1
  class SignInController < ApplicationController
    def create
      @auth = SignInService.new(sign_in_params)
      @auth.current_device = current_device

      if @auth.save
        head :ok
      else
        record_invalid @auth.errors
      end
    end

    private

    def sign_in_params
      params.require(:user).permit(
        :provider, :email, :password, :uid
      )
    end
  end
end
