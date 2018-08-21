class Order < ApplicationRecord

    def self.get_orders(mp_id, start_date, end_date)
        client = MWS.orders(
        marketplace: ENV['MARKET_PLACE_ID'],
        merchant_id: ENV['PCLIENT_SELLER_ID'],
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

        response = client.list_orders(mp_id, created_after: start_date,created_before: end_date, fulfillment_channel: ['AFN'])
        p = response.parse
        Order.save_order_ids(p['Orders']['Order'])
        Order.list_orders_by_next_token(p['NextToken'])
    end


    def self.list_orders_by_next_token(next_token)
        client = MWS.orders(marketplace: ENV['MARKET_PLACE_ID'],merchant_id: ENV['PCLIENT_SELLER_ID'],aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],auth_token: ENV['PCLIENT_AUTH_TOKEN'] )
        
        if next_token == nil
            return 
        else
            begin
                response = client.list_orders_by_next_token(next_token)
            rescue Peddler::Errors::RequestThrottled
                binding.pry
                back_off_exponentially
                retry
            end
            p = response.parse
            binding.pry
            Order.save_order_ids(p['Orders']['Order'])
            Order.list_orders_by_next_token(p['NextToken'])
        end
    end

    def self.save_order_ids(data)
        binding.pry

        data.each do |row|
            Order.find_or_create_by(amz_order_number:row['AmazonOrderId'],purchase_date:row['PurchaseDate'])
        end
    end


end

