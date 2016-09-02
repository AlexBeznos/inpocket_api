class User < ApplicationRecord
  mount_uploader :photo, BaseUploader

  validates :first_name, :last_name, presence: true, if: :signed
end
