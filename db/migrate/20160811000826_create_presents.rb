class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      t.string :image
      t.string :price
      t.text :description
      t.string :name
      t.integer :place_id

      t.timestamps
    end

    add_index :presents, :place_id
  end
end
