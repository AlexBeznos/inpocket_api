attributes :id, :content, :stars

node :created_at do |fe|
  fe.created_at_unix
end

node :image do |fe|
  fe.image.url
end
