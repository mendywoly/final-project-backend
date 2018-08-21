class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.string :msku
      t.string :fnsku
      t.string :asin
      t.string :product_name
      t.string :product_group
      t.string :brand
      t.string :fulfilled_by
      t.string :your_price
      t.string :sales_price
      t.string :longest_side
      t.string :median_side
      t.string :shortest_side
      t.string :length_and_girth
      t.string :unit_of_dimension
      t.string :item_package_weight
      t.string :unit_of_weight
      t.string :product_size_tier
      t.string :currency
      t.string :estimated_fee_total
      t.string :estimated_referral_fee_per_unit
      t.string :estimated_variable_closing_fee
      t.string :estimated_order_handling_fee_per_order
      t.string :estimated_pick_pack_fee_per_unit
      t.string :estimated_weight_handling_fee_per_unit
      t.string :expected_fulfillment_fee_per_unit
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
  end
end
