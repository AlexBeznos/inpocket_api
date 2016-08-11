class Place < ApplicationRecord
  serialize :phones, Array
  serialize :images, Array

  has_many :beacons

  acts_as_mappable :default_units => :kms,
                   :auto_geocode => {
                    :field => :address,
                    :error_message =>'Could not geocode address'
                  }

  validates :name, :description, :logo, :address, presence: true
end
