class ChangeOrderTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_status, :boolean
    add_column :orders, :order_status, :integer
  end
end
