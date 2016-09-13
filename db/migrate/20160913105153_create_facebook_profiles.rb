class CreateFacebookProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :facebook_profiles do |t|
      t.integer :uid
      t.string :email
      t.boolean :gender
      t.string :username
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end

    add_index :facebook_profiles, :uid
    add_index :facebook_profiles, :user_id
  end
end
