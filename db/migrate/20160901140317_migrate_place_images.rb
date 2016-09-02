class MigratePlaceImages < ActiveRecord::Migration[5.0]
  def self.up
    Place.serialize(:images, Array)
    Place.find_each do |pl|
      pl.images.each do |im|
        PlaceImage.create(remote_image_url: im, place_id: pl.id)
      end
    end
  end

  def self.down
  end
end
