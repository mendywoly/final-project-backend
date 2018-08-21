class Report < ApplicationRecord

    def self.get_reports_list
        client = MWS.reports(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            response = client.get_report_request_list
            parsed_response = response.parse
            return parsed_response   

            # if parsed_response['NextToken'] == nil
            #     return parsed_response   
            # else
            #     Report.get_report_request_list_by_next_token(parsed_response)
            # end
    end

    def self.get_report_request_list_by_next_token(next_token)
            client = MWS.reports(
                marketplace: ENV['MARKET_PLACE_ID'],
                merchant_id: ENV['PCLIENT_SELLER_ID'],
                aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            response = client.get_report_request_list_by_next_token(next_token)
            parsed_response = response.parse
    end

    def self.request_report(report_name)
        
        client = MWS.reports(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            response = client.request_report(report_name)
            # response = client.request_report(report_name, start_date:start_date , end_date: end_date )
            p = response.parse
    end

    def self.get_report(report_id)
        client = MWS.reports(
            marketplace: ENV['MARKET_PLACE_ID'],
            merchant_id: ENV['PCLIENT_SELLER_ID'],
            aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
            auth_token: ENV['PCLIENT_AUTH_TOKEN'] )

            response = client.get_report(report_id)
            p = response.parse
    end

    def self.export_to_csv(data, file_name)
        file_path = "#{Rails.root}/lib/" + file_name + ".txt"

        CSV.open(file_path, "wb", {:col_sep => "\t"}) do |csv|
            csv << data.headers
            data.each do |row|
                csv << row
            end
        end
    end


end
