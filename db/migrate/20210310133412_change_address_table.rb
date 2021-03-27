class ChangeAddressTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address, :string
    add_column :addresses, :user_address, :string
  end
end
