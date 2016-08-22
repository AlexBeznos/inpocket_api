class AddFieldsToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :site, :string
    add_column :places, :working_hours, :text
    add_column :places, :in_pocket, :boolean, default: false
    add_column :places, :category, :string
  end
end
