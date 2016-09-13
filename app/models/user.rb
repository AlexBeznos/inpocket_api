class User < ApplicationRecord
  has_secure_password validations: false
  mount_base64_uploader :photo, BaseUploader

  has_many :orders, dependent: :destroy
  has_many :user_scores, dependent: :destroy

  with_options if: :signed do |user|
    user.validates :first_name, :last_name, :email, presence: true
    user.validates :email, email: true
  end

end
