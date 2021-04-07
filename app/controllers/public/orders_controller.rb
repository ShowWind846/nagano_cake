class Public::OrdersController < ApplicationController
  include Searchform

  # 一連の流れ：新規＞確認＞登録
  def new
    @order = Order.new
    @r_s_addresses = Address.where(user_id:[current_user.id])
    @user_addresses = Address.where(user_id: current_user.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @cart_items = CartItem.where(user_id: current_user.id)
    @sum = 0
    @user_full_name = current_user.last_name + " " + current_user.first_name
    if params[:order][:select_option] == "0"
      @order.user_address = current_user.address
      @order.user_postal_code = current_user.postal_code
      @order.user_name = @user_full_name
    elsif params[:order][:select_option] == "1"
      @order.user_address = Address.find(order_params[:user]).user_address
      @order.user_postal_code = Address.find(order_params[:user]).postal_code
      @order.user_name = Address.find(order_params[:user]).name
    elsif params[:order][:select_option] == "2"
      @order.user_address = order_params[:user_address]
      @order.user_postal_code = order_params[:user_postal_code]
      @order.user_name = order_params[:user_name]
    end
  end

  def create
    # if文を使用して、セーブできたのみ表示をするのもあり。
    @order = Order.new(order_params)
    @order.user = current_user
    @order.user_id = current_user.id
    @cart_items = CartItem.where(user_id:[current_user.id])
    if @order.save
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.purchase_price = (cart_item.amount*Item.find(cart_item.item_id).price)
        @order_detail.production_status = true
        @order_detail.save
      end
      @cart_items.destroy_all
      redirect_to complete_public_orders_path
    else
      #暇ならエラーメッセージの表示もできれば丁寧
      redirect_to new_public_order_path
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:payment_style,:postage,:order_status,:user_name,:user_address,:user_postal_code,:select_option,:charge,:user)
  end

end
