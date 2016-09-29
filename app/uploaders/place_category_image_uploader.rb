class PlaceCategoryImageUploader < BaseUploader

  def extension_whitelist
    %w(png)
  end
end
