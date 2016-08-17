class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :place_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
