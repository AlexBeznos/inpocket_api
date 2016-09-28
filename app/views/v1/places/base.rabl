attributes :id, :description, :name, :lng, :lat, :color, :in_pocket, :category, :address, :phones

node :color_rgb do |pl|
  pl.color_rgb
end

node :color_hex do |pl|
  pl.color_hex
end

node :logo do |pl|
  pl.logo.url
end

node :card_image do |place|
  place.card_image.url
end
