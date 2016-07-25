class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer :platform
      t.string :push_token
      t.string :access_token
      t.integer :user_id

      t.timestamps
    end

    add_index :devices, :user_id
  end
end
