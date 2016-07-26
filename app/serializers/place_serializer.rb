class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :description, :name, :address, :phones, :logo, :images, :lng, :lat
end
