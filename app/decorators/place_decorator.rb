class PlaceDecorator < Draper::Decorator
  delegate_all

  def working_hours_decorated
    working_hours.map do |days, hours|
      "#{days}: #{hours}"
    end
  end
end
