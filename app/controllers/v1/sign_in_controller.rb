module V1
  class SignInController < ApplicationController
    def create
      @auth = SignInService.new(sign_in_params)
      @auth.current_user = current_user

      unless @auth.save
        record_invalid @auth.errors
      end
    end

    private

    def sign_in_params
      params.require(:user).permit(:first_name, :last_name, :provider, :email, :password, :photo)
    end
  end
end
