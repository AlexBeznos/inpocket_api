class Share < ApplicationRecord
  include Paginatable

  mount_uploader :image, BaseUploader

  belongs_to :place

  validates :name, :image, :description, :place, presence: true
end
