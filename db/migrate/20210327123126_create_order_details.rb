class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
      create_table :order_details do |t|
        t.integer :item_id
        t.integer :order_id
        t.integer :amount
        t.integer :purchase_price
        t.boolean :production_status, default: 'true'
      t.timestamps
    end
  end
end
