# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# file_path = "#{Rails.root}/lib/fee.txt"
# Fee.parse(file_path)

# binding.pry
# file_path = "#{Rails.root}/lib/product_names_random.csv"
# File.read(file_path)

# User.create(username: 'a', password: 'a')
# file_path = "#{Rails.root}/lib/sabrent_inv_health.txt"

# CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", col_sep: "\t", quote_char: "\x00", headers: true) do |row|
#     t = Product.find_or_create_by(msku: row['sku'],fnsku: row['fnsku'], asin: row['asin'] )
#         t.product_name = row['product-name']
#         t.sellable_quantity = row['sellable-quantity']
#         t.unsellable_quantity = row['unsellable-quantity']
#         t.units_shipped_last_24_hrs = row['units-shipped-last-24-hrs']
#         t.units_shipped_last_7_days = row['units-shipped-last-7-days']
#         t.units_shipped_last_30_days = row['units-shipped-last-30-days']
#         t.units_shipped_last_90_days = row['units-shipped-last-90-days']
#         t.units_shipped_last_180_days = row['units-shipped-last-180-days']
#         t.units_shipped_last_365_days = row['units-shipped-last-365-days']
#         t.num_afn_new_sellers = row['num-afn-new-sellers']
#         t.num_afn_used_sellers = row['num-afn-used-sellers']
#         t.your_price = row['your-price']
#         t.sales_price = row['sales-price']
#         t.lowest_afn_new_price = row['lowest-afn-new-price']
#         t.lowest_afn_used_price = row['lowest-afn-used-price']
#         t.lowest_mfn_new_price = row['lowest-mfn-new-price']
#         t.lowest_mfn_used_price = row['lowest-mfn-used-price']
#         t.qty_with_removals_in_progress = row['qty-with-removals-in-progress']
#         t.in_bound_quantity = row['in-bound-quantity']
#         t.sales_rank = row['sales-rank']

#         t.user = User.last
#     t.save
# end


# # file_path = "#{Rails.root}/lib/10485544388017736.txt"
# # Product.add_reserved_from_file(file_path)


# Load Fees

# file_path = "#{Rails.root}/lib/fee_preview_sabrent.txt"
# CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", col_sep: "\t", quote_char: "\x00", headers: true) do |row|

#     t = Fee.new
#         t.msku =	row['sku']
#         t.fnsku =	row['fnsku']
#         t.asin =	row['asin']
#         t.product_name =	row['product-name']
#         t.product_group =	row['product-group']
#         t.brand =	row['brand']
#         t.fulfilled_by =	row['fulfilled-by']
#         t.your_price =	row['your-price']
#         t.sales_price =	row['sales-price']
#         t.longest_side =	row['longest-side']
#         t.median_side =	row['median-side']
#         t.shortest_side =	row['shortest-side']
#         t.length_and_girth =	row['length-and-girth']
#         t.unit_of_dimension =	row['unit-of-dimension']
#         t.item_package_weight =	row['item-package-weight']
#         t.unit_of_weight =	row['unit-of-weight']
#         t.product_size_tier =	row['product-size-tier']
#         t.currency =	row['currency']
#         t.estimated_fee_total =	row['estimated-fee-total']
#         t.estimated_referral_fee_per_unit =	row['estimated-referral-fee-per-unit']
#         t.estimated_variable_closing_fee =	row['estimated-variable-closing-fee']
#         t.estimated_order_handling_fee_per_order =	row['estimated-order-handling-fee-per-order']
#         t.estimated_pick_pack_fee_per_unit =	row['estimated-pick-pack-fee-per-unit']
#         t.estimated_weight_handling_fee_per_unit =	row['estimated-weight-handling-fee-per-unit']
#         t.expected_fulfillment_fee_per_unit =	row['expected-fulfillment-fee-per-unit']
#         t.user = User.last
#         t.product = Product.find_or_create_by(msku: row['sku'],fnsku: row['fnsku'], asin: row['asin'], product_name: row['product-name'],  user_id: User.last.id )
#     t.save
# end

