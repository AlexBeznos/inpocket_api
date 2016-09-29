class AddImageToPlaceCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :place_categories, :image, :string
  end
end
