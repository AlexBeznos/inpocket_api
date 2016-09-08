class DeviceAuthService
  alias :read_attribute_for_serialization :send
  attr_reader :id, :errors, :user, :device

  def initialize(device_attributes)
    @device_attributes = device_attributes
    @user = User.new
    @device = Device.new(device_attributes)
  end

  def self.model_name
    @_model_name ||= ActiveModel::Name.new(self)
  end

  def save
    get_device_by_id || save_user_and_device
  rescue ActiveRecord::RecordInvalid
    fill_in_errors
    false
  end

  private

  def get_device_by_id
    return false unless @device_attributes[:uniq_id]
    
    attrs = {
      uniq_id: @device_attributes[:uniq_id],
      platform: @device_attributes[:platform]
    }

    device = Device.includes(:user).find_by(attrs)

    if device
      device.update!(push_token: @device_attributes[:push_token])
      @device = device
      @user = device.user
    else
      false
    end
  end

  def save_user_and_device
    @device.transaction do
      @user.save!
      @device.user = @user
      @device.save!
    end
  end

  def fill_in_errors
    @errors = {}
    @errors[:device] = @device.errors.messages
    @errors[:user] = @user.errors.messages
  end
end
