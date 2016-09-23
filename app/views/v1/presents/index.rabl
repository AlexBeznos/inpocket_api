collection @presents
attributes :id, :name, :price, :description

node :image do |pr|
  pr.image.url
end

node :distance do
  2.3
end

child :place do
  attributes :id, :name
end
