extends 'v1/users/base'
object @user
attributes :signed

node :with_changable_password do |u|
  !u.password_digest.blank?
end

child :facebook_profile do
  attributes :username
end

child :vk_profile do
  attributes :username
end
