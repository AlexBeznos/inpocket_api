module V1
  class SignUpController < ApplicationController
    def create
      @auth = SignUpService.new(sign_up_params)
      @auth.current_user = current_user

      unless @auth.save
        record_invalid @auth.errors
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(
        :first_name, :last_name, :provider, :email, :password, :photo,
        :username, :uid, :gender
      )
    end
  end
end
