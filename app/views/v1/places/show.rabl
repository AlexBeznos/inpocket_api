object @place
extends 'v1/places/base'

attributes :address, :phones, :working_hours, :working_hours_decorated, :site, :category

node :is_present_received do |place|
  place.present_received?(@current_user)
end

node :images do |place|
  place.images_array
end
