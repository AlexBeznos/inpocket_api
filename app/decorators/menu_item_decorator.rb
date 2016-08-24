class MenuItemDecorator < Draper::Decorator
  delegate_all

  def bonus
    place_percent = menu_category.place.bonus_part
    (price * (place_percent * 0.01)).round
  end
end
