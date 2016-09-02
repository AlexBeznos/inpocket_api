attributes :id, :description, :name, :lng, :lat, :color, :in_pocket

node :color_rgb do |pl|
  pl.color_rgb
end

node :color_hex do |pl|
  pl.color_hex
end

node :logo do |pl|
  pl.logo.url
end
