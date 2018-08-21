class Product < ApplicationRecord
    belongs_to :user
    has_many :fees

    
    def self.update_inventory(skus)
        client = MWS.fulfillment_inventory(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            # thirty_days_ago = 30.days.ago.iso8601
            response = client.list_inventory_supply(seller_skus: skus)
            p = response.parse
            Product.helper_method(p)
            if p['NextToken'] == nil
                return 
            else
                Product.update_inventory_next_token(p['NextToken'])
            end
    end

    def self.helper_method(parsed_response)
        if parsed_response['InventorySupplyList']['member'].class == Array
            parsed_response['InventorySupplyList']['member'].each do |resp|
                product = Product.find_by(msku: resp['SellerSKU'])
                product.quantity_amz = resp['InStockSupplyQuantity']
                product.save
            end
        else
            product = Product.find_by(msku: parsed_response['InventorySupplyList']['member']['SellerSKU']) 
            product.quantity_amz = parsed_response['InventorySupplyList']['member']['InStockSupplyQuantity']
            product.save
        end
        # if parsed_response.class == Hash
        #     product = Product.find_by(msku: parsed_response['InventorySupplyList']['member']['SellerSKU']) 
        #     product.quantity_amz = parsed_response['InventorySupplyList']['member']['InStockSupplyQuantity']
        #     product.save
        # else
        #     parsed_response['InventorySupplyList']['member'].each do |resp|
        #         product = Product.find_by(msku: resp['SellerSKU'])
        #         product.quantity_amz = resp['InStockSupplyQuantity']
        #         product.save
        #     end
        # end

    end

    def self.update_all_inventory
        next_token = Product.update_inventory
        if next_token != false
            loop do
                response = Product.update_inventory_next_token(next_token)
                break if next_token == false
            end 
        end        
    end



    def self.update_inventory_next_token(next_token)
        client = MWS.fulfillment_inventory(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            response = client.list_inventory_supply_by_next_token(next_token)
            p = response.parse
            Product.helper_method(p)

            if p['NextToken'] == nil
                return 
            else
                Product.update_inventory_next_token(p['NextToken'])
            end

    end

   def self.add_reserved(data)
       data.each do |row|
            product = Product.find_by(msku: row['Merchant SKU'], fnsku: row['Fulfillment Network SKU'], asin: row['ASIN'])
            if !!product
                product.reserved_amz = row['Reserved - FC Transfer'] + row['Reserved - FC Processing']
                product.save
            end
        end
   end

   def self.add_reserved_from_file(file_path)
        CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", col_sep: "\t", quote_char: "\x00", headers: true) do |row|
            next if Product.find_by(msku: row['sku'], fnsku: row['fnsku'], asin: row['asin'], user_id: 1) == nil
            product = Product.find_by(msku: row['sku'], fnsku: row['fnsku'], asin: row['asin'], user_id: 1)
            product.reserved_amz = row['reserved_fc-transfers'] + row['reserved_fc-processing']
            product.save
        end
    end


    def self.add_inv_health(data, current_user)
        data.each do |row|
            t = Product.find_or_create_by(msku: row['sku'],fnsku: row['fnsku'], asin: row['asin'] )
                t.product_name = row['product-name']
                t.sellable_quantity = row['sellable-quantity']
                t.unsellable_quantity = row['unsellable-quantity']
                t.units_shipped_last_24_hrs = row['units-shipped-last-24-hrs']
                t.units_shipped_last_7_days = row['units-shipped-last-7-days']
                t.units_shipped_last_30_days = row['units-shipped-last-30-days']
                t.units_shipped_last_90_days = row['units-shipped-last-90-days']
                t.units_shipped_last_180_days = row['units-shipped-last-180-days']
                t.units_shipped_last_365_days = row['units-shipped-last-365-days']
                t.num_afn_new_sellers = row['num-afn-new-sellers']
                t.num_afn_used_sellers = row['num-afn-used-sellers']
                t.your_price = row['your-price']
                t.sales_price = row['sales-price']
                t.lowest_afn_new_price = row['lowest-afn-new-price']
                t.lowest_afn_used_price = row['lowest-afn-used-price']
                t.lowest_mfn_new_price = row['lowest-mfn-new-price']
                t.lowest_mfn_used_price = row['lowest-mfn-used-price']
                t.qty_with_removals_in_progress = row['qty-with-removals-in-progress']
                t.in_bound_quantity = row['in-bound-quantity']
                t.sales_rank = row['sales-rank']

                t.user = current_user
            t.save
        end
    end


end
