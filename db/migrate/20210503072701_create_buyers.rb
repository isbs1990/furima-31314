class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :buydeliveryaddress, null: false
      t.integer :pref_id, null: false
      t.string :buydeliverycity, null: false
      t.string :buydeliverynum, null: false
      t.string :buydeliverybld
      t.string :buytellnum, null: false
      t.references :order, null: false ,foreign_key: true
      t.timestamps
    end
  end
end
