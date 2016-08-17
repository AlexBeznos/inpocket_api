class Present < ApplicationRecord
  belongs_to :place

  validates :name, :description, :image, :price, presence: true

  after_save :update_debutes, if: :debut

  def update_debutes
    Present.where(debut: true, place: place)
           .where.not(id: id)
           .update_all(debut: false)
  end
end
