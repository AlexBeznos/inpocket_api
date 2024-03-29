class User < ApplicationRecord
  attr_accessor :current_password, :provider
  has_secure_password validations: false
  mount_base64_uploader :photo, BaseUploader

  has_many :orders, dependent: :destroy
  has_many :user_scores, dependent: :destroy
  has_one :facebook_profile, dependent: :destroy
  has_one :vk_profile, dependent: :destroy

  with_options if: :signed do |user|
    user.validates :email, presence: true, unless: -> (u) {
      u.vk_profile || u.facebook_profile ||
      (u.provider && ['vk', 'facebool'].include?(u.provider))
    }
    user.validates :email, email: true, allow_blank: true, allow_nil: true
  end

  validate :update_current_password, on: :update,
    if: -> (u) { u.password_digest_changed? && u.password_digest_was != '' }

  before_create :set_referal

  def update_current_password
    if !current_password || !User.find(id).authenticate(current_password)
      errors.add(:current_password, 'should be valid')
    end
  end

  def set_referal
    self.referal_number = SecureRandom.random_number.to_s.split('.').last.first(6)
    set_referal if User.where(referal_number: referal_number).any?
  end

  def update_with_networks(params)
    vk_profile_params = params.delete(:vk_profile)
    facebook_profile_params = params.delete(:facebook_profile)

    self.update(params) && update_vk_profile(vk_profile_params) && update_facebook_profile(facebook_profile_params)
  end

  private

  def update_vk_profile(params)
    return true unless params
    ActiveRecord::Base.transaction do
      self.vk_profile.try(:destroy)
      vk_profile = VkProfile.new(params)
      vk_profile.user = self

      unless vk_profile.save
        self.errors.add(:vk_profile, vk_profile.errors)
      end

      !self.errors.any?
    end
  end

  def update_facebook_profile(params)
    return true unless params
    ActiveRecord::Base.transaction do
      self.facebook_profile.try(:destroy)
      facebook_profile = FacebookProfile.new(params)
      facebook_profile.user = self

      unless facebook_profile.save
        self.errors.add(:facebook_profile, facebook_profile.errors)
      end

      !self.errors.any?
    end
  end

end
