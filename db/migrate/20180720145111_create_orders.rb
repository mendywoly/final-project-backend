class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :amz_order_number
      t.string :purchase_date
      t.timestamps
    end
  end
end
