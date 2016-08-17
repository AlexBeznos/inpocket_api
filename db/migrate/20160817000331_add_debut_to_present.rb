class AddDebutToPresent < ActiveRecord::Migration[5.0]
  def change
    add_column :presents, :debut, :boolean, default: false
  end
end
