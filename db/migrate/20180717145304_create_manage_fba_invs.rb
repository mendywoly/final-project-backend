class CreateManageFbaInvs < ActiveRecord::Migration[5.2]
  def change
    create_table :manage_fba_invs do |t|
      t.string :sku
      t.string :fnsku
      t.string :asin
      t.string :product_name
      t.string :condition
      t.string :your_price
      t.string :mfn_listing_exists
      t.string :mfn_fulfillable_quantity
      t.string :afn_listing_exists
      t.integer :afn_warehouse_quantity
      t.integer :afn_fulfillable_quantity
      t.integer :afn_unsellable_quantity
      t.integer :afn_reserved_quantity
      t.integer :afn_total_quantity
      t.integer :per_unit_volume
      t.integer :afn_inbound_working_quantity
      t.integer :afn_inbound_shipped_quantity
      t.integer :afn_inbound_receiving_quantity
      t.timestamps
    end
  end
end
