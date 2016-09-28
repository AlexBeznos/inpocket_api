object @place
extends 'v1/places/base'

node :is_present_received do |place|
  place.present_received?(@current_user)
end

node :score do |place|
  place.currect_user_score
end
