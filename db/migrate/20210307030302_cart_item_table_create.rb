class CartItemTableCreate < ActiveRecord::Migration[5.2]
  def change
    drop_table :public_cart_items
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      t.timestamps
    end
  end
end
