class CreateUserScores < ActiveRecord::Migration[5.0]
  def change
    create_table :user_scores do |t|
      t.integer :bonus, default: 0
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end

    add_index :user_scores, :user_id
    add_index :user_scores, :place_id
  end
end
