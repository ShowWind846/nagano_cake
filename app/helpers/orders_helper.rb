module OrdersHelper

  def price(amount,price)
    amount*price
  end

  def yen(amount)
    amount.to_s(:delimited)
  end

end
