class AdddetailCategoryIdToitems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :detail_category_id, :integer
  end
end
