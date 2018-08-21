class FeeSerializer < ActiveModel::Serializer
  attributes ["id", "msku", "fnsku", "asin", "product_name", "product_group", "brand", "fulfilled_by", "your_price", "sales_price", "longest_side", "median_side", "shortest_side", "length_and_girth", "unit_of_dimension", "item_package_weight", "unit_of_weight", "product_size_tier", "currency", "estimated_fee_total", "estimated_referral_fee_per_unit", "estimated_variable_closing_fee", "estimated_order_handling_fee_per_order", "estimated_pick_pack_fee_per_unit", "estimated_weight_handling_fee_per_unit", "expected_fulfillment_fee_per_unit", "user_id", "product_id", "created_at", "updated_at"] 
  belongs_to :product
end
