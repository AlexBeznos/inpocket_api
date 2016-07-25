class PreSignInServiceSerializer < ActiveModel::Serializer
  attributes :device, :user

  def device
    DeviceSerializer.new(object.device)
  end

  def user
    UserSerializer.new(object.user)
  end
end
