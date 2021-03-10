class DropPublicItemsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :public_items
  end
end
