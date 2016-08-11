class Share < ApplicationRecord
  belongs_to :place

  validates :name, :image, :description, :place, presence: true
end
