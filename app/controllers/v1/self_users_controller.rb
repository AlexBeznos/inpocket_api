module V1
  class SelfUsersController < ApplicationController
    def show
      @user = current_user
    end

    def update
      @user = current_user

      if @user.update_with_networks(user_params)
        head :ok
      else
        record_invalid @user.errors
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :photo, :password, :email, :current_password,
        vk_profile: [:username, :email, :uid, :gender, :birthday],
        facebook_profile: [:username, :email, :uid, :gender, :birthday]
      )
    end
  end
end
