class CreateDebutPresentRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :debut_present_relations do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end

    add_index :debut_present_relations, :user_id
    add_index :debut_present_relations, :place_id
  end
end
