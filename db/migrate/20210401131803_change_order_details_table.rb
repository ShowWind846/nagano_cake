class ChangeOrderDetailsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :production_status, :boolean
    add_column :order_details, :production_status, :integer, default: 1
  end
end
