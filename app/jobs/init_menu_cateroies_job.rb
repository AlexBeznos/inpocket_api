class InitMenuCategoriesJob < ApplicationJob
  queue_as :high

  def perform(place_id)
    p ')+_+_+_+'
    p 'MenuCategories worked'
    p Place.find(place_id)
  end
end
