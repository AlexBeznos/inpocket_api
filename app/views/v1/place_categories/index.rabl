collection @categories
attributes :id, :name

node :image do |category|
  category.image.url
end
