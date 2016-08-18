class Share < ApplicationRecord
  include Paginatable
  
  belongs_to :place

  validates :name, :image, :description, :place, presence: true
end
