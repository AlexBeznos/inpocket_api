class PlaceDecorator < Draper::Decorator
  delegate_all

  def working_hours_string
    working_hours.to_s
  end
end
