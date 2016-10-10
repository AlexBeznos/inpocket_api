attributes :id, :referal_number

node :photo do |u|
  u.photo.url
end

node :first_name do |u|
  u.first_name.blank? ? 'Аноним' : u.first_name
end

node :last_name do |u|
  u.last_name.blank? ? 'Аноним' : u.last_name
end
