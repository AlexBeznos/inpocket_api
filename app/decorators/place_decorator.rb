class PlaceDecorator < Draper::Decorator
  delegate_all

  def working_hours_decorated
    working_hours.map do |days, hours|
      "#{days}: #{hours}"
    end
  end

  def images_array
    photos.map { |ph| ph.image.url }
  end

  def currect_user_score
    user_score = user_scores.find_by(user: @current_user)
    user_score.try(:score) || 0
  end
end
