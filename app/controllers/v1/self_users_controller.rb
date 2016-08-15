module V1
  class SelfUsersController < ApplicationController
    def show
      @user = current_user

      respond_with @user
    end
  end
end
