object @place
extends 'v1/places/base'

attributes :address, :phones, :working_hours, :working_hours_string, :site, :category

node :present_received? do |place|
  place.present_received?(@current_user)
end
