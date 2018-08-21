# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_20_145111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fees", force: :cascade do |t|
    t.string "msku"
    t.string "fnsku"
    t.string "asin"
    t.string "product_name"
    t.string "product_group"
    t.string "brand"
    t.string "fulfilled_by"
    t.string "your_price"
    t.string "sales_price"
    t.string "longest_side"
    t.string "median_side"
    t.string "shortest_side"
    t.string "length_and_girth"
    t.string "unit_of_dimension"
    t.string "item_package_weight"
    t.string "unit_of_weight"
    t.string "product_size_tier"
    t.string "currency"
    t.string "estimated_fee_total"
    t.string "estimated_referral_fee_per_unit"
    t.string "estimated_variable_closing_fee"
    t.string "estimated_order_handling_fee_per_order"
    t.string "estimated_pick_pack_fee_per_unit"
    t.string "estimated_weight_handling_fee_per_unit"
    t.string "expected_fulfillment_fee_per_unit"
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manage_fba_invs", force: :cascade do |t|
    t.string "sku"
    t.string "fnsku"
    t.string "asin"
    t.string "product_name"
    t.string "condition"
    t.string "your_price"
    t.string "mfn_listing_exists"
    t.string "mfn_fulfillable_quantity"
    t.string "afn_listing_exists"
    t.integer "afn_warehouse_quantity"
    t.integer "afn_fulfillable_quantity"
    t.integer "afn_unsellable_quantity"
    t.integer "afn_reserved_quantity"
    t.integer "afn_total_quantity"
    t.integer "per_unit_volume"
    t.integer "afn_inbound_working_quantity"
    t.integer "afn_inbound_shipped_quantity"
    t.integer "afn_inbound_receiving_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "amz_order_number"
    t.string "purchase_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "msku"
    t.string "fnsku"
    t.string "asin"
    t.string "product_name"
    t.integer "sellable_quantity", default: 0
    t.integer "unsellable_quantity", default: 0
    t.integer "units_shipped_last_24_hrs", default: 0
    t.integer "units_shipped_last_7_days", default: 0
    t.integer "units_shipped_last_30_days", default: 0
    t.integer "units_shipped_last_90_days", default: 0
    t.integer "units_shipped_last_180_days", default: 0
    t.integer "units_shipped_last_365_days", default: 0
    t.integer "num_afn_new_sellers", default: 0
    t.integer "num_afn_used_sellers", default: 0
    t.decimal "your_price", default: "0.0"
    t.decimal "sales_price", default: "0.0"
    t.decimal "lowest_afn_new_price", default: "0.0"
    t.decimal "lowest_afn_used_price", default: "0.0"
    t.decimal "lowest_mfn_new_price", default: "0.0"
    t.decimal "lowest_mfn_used_price", default: "0.0"
    t.integer "qty_with_removals_in_progress", default: 0
    t.integer "in_bound_quantity", default: 0
    t.integer "sales_rank", default: 0
    t.integer "quantity_amz", default: 0
    t.integer "reserved_amz", default: 0
    t.integer "quantity_default_warehouse", default: 0
    t.integer "desired_days_of_stock", default: 0
    t.integer "daily_sales_average", default: 0
    t.boolean "on_inv_management", default: false
    t.integer "user_id"
    t.text "prep_instructions", default: ""
    t.integer "desired_stock_quantity", default: 0
    t.integer "lead_time", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
