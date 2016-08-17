object @place
extends 'v1/places/base'

node :present_received? do |place|
  place.present_received?(@current_user)
end
