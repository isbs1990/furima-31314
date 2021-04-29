class AdddetailStatusIdToitems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :detail_status_id, :integer
  end
end
