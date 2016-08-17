class AddStarsToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :stars, :integer
  end
end
