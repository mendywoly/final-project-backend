class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :msku
      t.string :fnsku
      t.string :asin
      t.string :product_name
      t.integer :sellable_quantity, default: 0
      t.integer :unsellable_quantity, default: 0
      t.integer :units_shipped_last_24_hrs, default: 0
      t.integer :units_shipped_last_7_days, default: 0
      t.integer :units_shipped_last_30_days, default: 0
      t.integer :units_shipped_last_90_days, default: 0
      t.integer :units_shipped_last_180_days, default: 0
      t.integer :units_shipped_last_365_days, default: 0
      t.integer :num_afn_new_sellers, default: 0
      t.integer :num_afn_used_sellers, default: 0
      t.decimal :your_price, default: 0
      t.decimal :sales_price, default: 0
      t.decimal :lowest_afn_new_price, default: 0
      t.decimal :lowest_afn_used_price, default: 0
      t.decimal :lowest_mfn_new_price, default: 0
      t.decimal :lowest_mfn_used_price, default: 0
      t.integer :qty_with_removals_in_progress, default: 0
      t.integer :in_bound_quantity, default: 0
      t.integer :sales_rank, default: 0
      t.integer :quantity_amz, default: 0
      t.integer :reserved_amz, default: 0
      t.integer :quantity_default_warehouse, default: 0
      t.integer :desired_days_of_stock, default: 0
      t.integer :daily_sales_average, default: 0
      t.boolean :on_inv_management, default: false
      t.integer :user_id
      t.text :prep_instructions, default: ''
      t.integer :desired_stock_quantity, default: 0
      t.integer :lead_time, default: 0

      t.timestamps
    end
  end
end
