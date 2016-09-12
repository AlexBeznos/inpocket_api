class User < ApplicationRecord
  attr_accessor :provider
  has_secure_password validations: false
  mount_base64_uploader :photo, BaseUploader

  has_many :orders, dependent: :destroy
  has_many :user_scores, dependent: :destroy

  validates :first_name, :last_name, presence: true, if: :signed

  with_options if: -> (u) { u.provider && u.provider == 'email' } do |user|
    user.validates :email, :password, presence: true
    user.validates :email, email: true
  end

end
