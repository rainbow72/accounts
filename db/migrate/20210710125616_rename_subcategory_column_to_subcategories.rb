class RenameSubcategoryColumnToSubcategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :subcategories, :subcategory, :name
  end
end
