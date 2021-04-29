class RenameDeliveryCostIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_cost_id, :deliverycost_id
  end
end
