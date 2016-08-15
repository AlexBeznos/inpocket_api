attributes :id, :description, :name, :address, :phones, :logo, :images, :lng, :lat, :color

node :color_rgb do |pl|
  pl.color_rgb
end

node :color_hex do |pl|
  pl.color_hex
end
