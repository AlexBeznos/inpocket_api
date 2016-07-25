module V1
  class PreSignInController < ApplicationController
    
    def create
      @psi = PreSignInService.new(sign_in_params)

      if @psi.save
        render json: @psi
      else
        record_invalid @psi.errors
      end
    end

    private

    def sign_in_params
      params.require(:device).permit(:platform, :push_token)
    end
  end
end
