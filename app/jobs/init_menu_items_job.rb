class InitMenuItemsJob < ActiveJob::Base
  queue_as :high

  def perform(place_id)
    p ')+_+_+_+'
    p 'MenuItems worked'
    p Place.find(place_id)
  end
end
