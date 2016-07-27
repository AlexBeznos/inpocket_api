class DeviceAuthService
  alias :read_attribute_for_serialization :send
  attr_reader :id, :errors, :user, :device

  def initialize(device_attributes)
    @user = User.new
    @device = Device.new(device_attributes)
  end

  def self.model_name
    @_model_name ||= ActiveModel::Name.new(self)
  end

  def save
    save_user_and_device
  rescue ActiveRecord::RecordInvalid
    fill_in_errors
    false
  end

  private

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
