class Present < ApplicationRecord
  belongs_to :place
  
  validates :name, :description, :image, :price, presence: true
end
