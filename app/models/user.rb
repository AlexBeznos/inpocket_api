class User < ApplicationRecord
  mount_base64_uploader :photo, BaseUploader

  validates :first_name, :last_name, presence: true, if: :signed
end
