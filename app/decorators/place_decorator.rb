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

  def currect_user_score(user)
    p '_+_+_++_+_'
    p 'should be current score'
    user_score = user_scores.find_by(user: user)
    p user_score
    raise unless user_score.try(:bonus)
    user_score.try(:bonus) || 0
  end

  def category
    category_record.try(:name)
  end
end
