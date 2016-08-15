class Place < ApplicationRecord
  include Colorable
  colorate :color
  serialize :phones, Array
  serialize :images, Array

  has_many :beacons, dependent: :destroy
  has_many :presents, dependent: :destroy
  has_many :shares, dependent: :destroy

  geocoded_by :address, latitude: :lat, longitude: :lng

  validates :name, :description, :logo, :address, presence: true
  validates :color, inclusion: { in: Colorable::COLORS.keys }
end
