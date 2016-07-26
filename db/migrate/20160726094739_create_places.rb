class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.text :description
      t.text :phones
      t.string :logo
      t.string :lat
      t.string :lng
      t.text :images

      t.timestamps
    end
  end
end
