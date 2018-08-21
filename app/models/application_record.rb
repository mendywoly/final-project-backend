class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.fuffilment_client
    client = MWS.fulfillment_inventory(
      marketplace: ENV['MARKET_PLACE_ID'],
      merchant_id: ENV['PCLIENT_SELLER_ID'],
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      auth_token: ENV['PCLIENT_AUTH_TOKEN'] )
  end


  def orders_client
     client = MWS.orders(
      marketplace: ENV['MARKET_PLACE_ID'],
      merchant_id: ENV['PCLIENT_SELLER_ID'],
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      auth_token: ENV['PCLIENT_AUTH_TOKEN'] )
  end

end
