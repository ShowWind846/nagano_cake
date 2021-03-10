class UserChange < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :is_active, true)
  end
end
