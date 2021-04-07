class ChangePublicOrderTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_status, :integer
    add_column :orders, :order_status, :integer, default: 1
  end
end
