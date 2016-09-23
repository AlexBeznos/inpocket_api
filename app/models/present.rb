class Present < ApplicationRecord
  include Paginatable
  include Filterable

  mount_base64_uploader :image, BaseUploader

  belongs_to :place

  scope :without_debut, -> { where(debut: false) }
  scope :by_place_id, -> (place_id) {
    where(place_id: place_id )
  }

  validates :name, :description, :image, :price, presence: true

  after_save :update_debutes, if: :debut

  def update_debutes
    Present.where(debut: true, place: place)
           .where.not(id: id)
           .update_all(debut: false)
  end
end
