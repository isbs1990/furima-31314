class RenameDetailStatusIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :detail_status_id,:detailstatus_id
  end
end
