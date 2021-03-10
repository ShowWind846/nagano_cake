class CartItem < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def total_price
    self.amount*Item.find(self.item_id).price
  end

  def tax_in
    
  end

end
