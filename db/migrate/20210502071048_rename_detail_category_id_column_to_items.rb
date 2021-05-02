class RenameDetailCategoryIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :detail_category_id,:detailcategory_id
  end
end
