class AddprefIdToitems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :pref_id, :integer
  end
end
