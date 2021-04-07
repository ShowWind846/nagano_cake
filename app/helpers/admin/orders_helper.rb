module Admin::OrdersHelper

  def user_address(postalcode,address,name)
    "〒 #{postalcode} #{address} #{name} "
  end

end
