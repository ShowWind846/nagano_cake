class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_style
      t.integer :postage
      t.boolean :order_status
      t.string :user_name
      t.string :user_address
      t.integer :user_postal_code
      t.integer :charge

      t.timestamps
    end
  end
end
