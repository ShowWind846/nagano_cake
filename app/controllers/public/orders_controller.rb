class Public::OrdersController < ApplicationController
  include Searchform

  # 一連の流れ：新規＞確認＞登録
  def new
    @order = Order.new
    @r_s_addresses = Address.where(user_id:[current_user.id])
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
    elsif params[:order][:select_option] == "2"
      @order.user_address = order_params[:user_address]
      @order.user_postal_code = order_params[:user_postal_code]
      @order.user_name = order_params[:user_name]
    end
  end

  def create
    # if文を使用して、セーブできたのみ表示をするのもあり。
    @order = Order.new(order_params)
    if @order.save
      @cart_item = CartItem.where(user_id:[current_user.id])
      @cart_item.destroy_all
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
    params.require(:order).permit(:user_id,:payment_style,:postage,:order_status,:user_name,:user_address,:user_postal_code,:select_option,:charge)
  end

end
