class User < ApplicationRecord
  mount_base64_uploader :photo, BaseUploader

  has_many :orders, dependent: :destroy
  has_many :user_scores, dependent: :destroy

  validates :first_name, :last_name, presence: true, if: :signed
end
