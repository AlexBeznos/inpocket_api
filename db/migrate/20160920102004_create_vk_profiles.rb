class CreateVkProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :vk_profiles do |t|
      t.integer :uid
      t.string :email
      t.integer :gender
      t.string :username
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end

    add_index :vk_profiles, :uid
    add_index :vk_profiles, :user_id
  end
end
