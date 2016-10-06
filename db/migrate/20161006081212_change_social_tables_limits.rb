class ChangeSocialTablesLimits < ActiveRecord::Migration[5.0]
  def change
    change_column :vk_profiles, :uid, :integer, limit: 8
    change_column :facebook_profiles, :uid, :integer, limit: 8
  end
end
