collection @cards
attributes :id, :bonus

child :place do
  attributes :id, :name, :category

  node :card_image do |place|
    place.card_image.url
  end

  node :color_rgb do |pl|
    pl.color_rgb
  end

  node :color_hex do |pl|
    pl.color_hex
  end
end
