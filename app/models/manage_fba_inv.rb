class ManageFbaInv < ApplicationRecord


    def self.update_report
        manage_fba_inv_report = Report.get_report('10384809707017729')
        manage_fba_inv_report.each do |row|
            sku = Sku.find_or_create_by(fnsku: row['fnsku'], asin: row['asin'], msku: row['sku'])
                sku.available_amz = row['afn-fulfillable-quantity']
            sku.save
        end
     end

    def self.fetch_from_amz
        client = MWS.fulfillment_inventory(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )
            
            current_time = Time.now.iso8601
            thirty_days_ago = 30.days.ago.iso8601

            binding.pry

            r = client.list_inventory_supply(query_start_date_time: current_time, response_group: 'Detailed')
            p = r.parse
    end


    # def self.get_reports_list

    #     client = MWS.reports(
    #         marketplace: ENV['MARKET_PLACE_ID'],
    #         merchant_id: ENV['PCLIENT_SELLER_ID'],
    #         aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    #         aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    #         auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

    #         response = client.get_report_request_list
    #         p = response.parse
    #         binding.pry
    # end

    # def self.get_report
    #     client = MWS.reports(
    #         marketplace: ENV['MARKET_PLACE_ID'],
    #         merchant_id: ENV['PCLIENT_SELLER_ID'],
    #         aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    #         aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    #         auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

    #         response = client.get_report('10378563055017729')
    #         p = response.parse
    #         binding.pry
    # end

    # def self.export_to_csv(data)
    #     file_path = "#{Rails.root}/lib/csv_export.csv"

    #     CSV.open(file_path, "wb") do |csv|
    #         csv << data.headers
    #         data.each do |row|
    #             csv << row
    #         end
    #     end
    # end

end