collection @shares
attributes :id, :name, :description

node :image do |s|
  s.image.url
end
