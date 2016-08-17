attributes :id, :content, :image, :stars

node :created_at do |feedback|
  feedback.created_at_unix
end
