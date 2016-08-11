class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :place_id

      t.timestamps
    end

    add_index :shares, :place_id
  end
end
