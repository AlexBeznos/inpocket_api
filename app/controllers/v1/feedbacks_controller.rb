module V1
  class FeedbacksController < ApplicationController
    before_action :find_place

    def index
      @feedbacks = Feedback.where(place: @place).paginated(params)

      respond_with @feedbacks
    end

    def create
      @feedback = Feedback.new(feedback_params)
      @feedback.place = @place
      @feedback.user = @current_user

      if @feedback.save
        respond_with @feedback
      else
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
