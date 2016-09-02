class CreatePlaceImages < ActiveRecord::Migration[5.0]
  def change
    create_table :place_images do |t|
      t.string :image
      t.integer :place_id

      t.timestamps
    end

    add_index :place_images, :place_id
  end
end
