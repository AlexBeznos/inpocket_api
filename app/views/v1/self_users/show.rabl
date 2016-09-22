extends 'v1/users/base'
object @user
attributes :signed

node :with_changable_password do |u|
  !u.password.blank?
end
