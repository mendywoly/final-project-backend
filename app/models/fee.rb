class Fee < ApplicationRecord
    belongs_to :user
    belongs_to :product


    def self.parse(file_path)       

    CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", col_sep: "\t", quote_char: "\x00", headers: true) do |row|
  
            t = Fee.new
            t.sku =	row['sku']
            t.fnsku =	row['fnsku']
            t.asin =	row['asin']
            t.product_name =	row['product-name']
            t.product_group =	row['product-group']
            t.brand =	row['brand']
            t.fulfilled_by =	row['fulfilled-by']
            t.your_price =	row['your-price']
            t.sales_price =	row['sales-price']
            t.longest_side =	row['longest-side']
            t.median_side =	row['median-side']
            t.shortest_side =	row['shortest-side']
            t.length_and_girth =	row['length-and-girth']
            t.unit_of_dimension =	row['unit-of-dimension']
            t.item_package_weight =	row['item-package-weight']
            t.unit_of_weight =	row['unit-of-weight']
            t.product_size_tier =	row['product-size-tier']
            t.currency =	row['currency']
            t.estimated_fee_total =	row['estimated-fee-total']
            t.estimated_referral_fee_per_unit =	row['estimated-referral-fee-per-unit']
            t.estimated_variable_closing_fee =	row['estimated-variable-closing-fee']
            t.estimated_order_handling_fee_per_order =	row['estimated-order-handling-fee-per-order']
            t.estimated_pick_pack_fee_per_unit =	row['estimated-pick-pack-fee-per-unit']
            t.estimated_weight_handling_fee_per_unit =	row['estimated-weight-handling-fee-per-unit']
            t.expected_fulfillment_fee_per_unit =	row['expected-fulfillment-fee-per-unit']
                        
            t.user = User.last
            
            t.save
        end
    end

end
