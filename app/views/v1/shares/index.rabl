collection @shares
attributes :id, :name, :description

node :image do |s|
  s.image.url
end

node :distance do
  2.3
end

child :place do
  attributes :id, :name
end
