class User < ApplicationRecord
  has_secure_password validations: false
  mount_base64_uploader :photo, BaseUploader

  has_many :orders, dependent: :destroy
  has_many :user_scores, dependent: :destroy
  has_one :facebook_profile, dependent: :destroy
  has_one :vk_profile, dependent: :destroy

  with_options if: :signed do |user|
    user.validates :email, presence: true
    user.validates :email, email: true, allow_blank: true
  end

end
