module V1
  class ReferalsController < ApplicationController
    def create
      errors = {}
      errors.merge!({user: 'not exist'}) unless User.find_by(referal_number: referal_params[:number])
      errors.merge!({user: 'self referal can\'t be used'}) if current_user.referal_number == referal_params[:number]

      if errors.empty?
        head :ok
      else
        record_invalid errors
      end
    end

    private

    def referal_params
      params.require(:referal).permit(:number)
    end
  end
end
