module V1
  class FeedbacksController < ApplicationController
    before_action :find_place

    def index
      @feedbacks = Feedback.where(place: @place).paginated(params)
    end

    def create
      @feedback = Feedback.new(feedback_params)
      @feedback.place = @place
      @feedback.user = @current_user

      unless @feedback.save
        record_invalid @feedback.errors
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(:content, :image, :stars)
    end

    def find_place
      @place = Place.find(params[:place_id])
    end
  end
end
