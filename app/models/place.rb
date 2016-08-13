class Place < ApplicationRecord
  include Colorable
  colorate :color
  serialize :phones, Array
  serialize :images, Array

  has_many :beacons, dependent: :destroy
  has_many :presents, dependent: :destroy
  has_many :shares, dependent: :destroy

  acts_as_mappable :default_units => :kms,
                   :auto_geocode => {
                    :field => :address,
                    :error_message =>'Could not geocode address'
                  }

  validates :name, :description, :logo, :address, presence: true
  validates :color, inclusion: { in: Colorable::COLORS.keys }
end
