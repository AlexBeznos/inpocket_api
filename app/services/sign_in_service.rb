class SignInService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :provider, :email, :password, :uid, :current_device

  validates :provider, presence: true
  validates :provider, inclusion: { in: ['email', 'facebook', 'vk'] }

  validates :email, :password, presence: true, if: -> (u) { u.provider == 'email' }
  validates :uid, presence: true, if: -> (u) { ['facebook', 'vk'].include? u.provider }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    return false unless self.valid?
    authenticated_user = send("#{provider}_authenticate")

    if authenticated_user
      # TODO: add merge
      true
    else
      false
    end
  end

  private

  def email_authenticate
    user = User.find_by(email: email)
    user.authenticate(password)
  end

  def facebook_authenticate
    FacebookProfile.find_by(uid: uid.to_i).try(:user)
  end

  def vk_authenticate
    VkProfile.find_by(uid: uid.to_i).try(:user)
  end
end
