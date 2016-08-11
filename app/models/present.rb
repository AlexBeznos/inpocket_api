class Present < ApplicationRecord
  validates :name, :description, :image, :price, presence: true
end
