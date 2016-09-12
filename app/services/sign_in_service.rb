class SignInService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :provider, :attributes, :current_user

  validates :provider, presence: true
  validates :provider, inclusion: { in: ['email', 'facebook', 'vk'] }

  def initialize(attributes = {})
    @attributes = attributes
    @attributes[:signed] = true
    @provider = @attributes[:provider]
  end

  def save
    current_user.provider = provider
    if self.valid? && current_user.update(attributes)
      true
    else
      self.errors.add(:user, current_user.errors) if current_user.errors.any?
      false
    end
  end

  def persisted?
    false
  end
end
