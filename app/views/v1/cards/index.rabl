collection @cards
attributes :id, :bonus

child :place do
  attributes :id, :name

  node :card_image do |place|
    place.card_image.url
  end
end
