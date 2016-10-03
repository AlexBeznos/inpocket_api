Superworker.define(:InitPlaceSuperworker, :place_id) do
  InitMenuCategoriesJob :place_id
  InitMenuItemsJob :place_id
end
