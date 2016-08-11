class CreateBeacons < ActiveRecord::Migration[5.0]
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.integer :place_id

      t.timestamps
    end

    add_index :beacons, :place_id
  end
end
