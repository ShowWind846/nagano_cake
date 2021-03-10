class Public::CartItemsController < ApplicationController

# cart_itemsのitem_id に itemの主キーをぶちこみたい。
  def index
    #@cart_items = CartItem.all
    @cart_items = CartItem.where(user_id: current_user.id)
    @total_price = @cart_items.to_a.sum { |cart_item| cart_item.total_price}
  end

  def update
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  # 商品詳細画面で、購入するボタンを押した際に実行されるアクション
  def create
    item = Item.find(params[:item_id])     #itemはこのページに表示されているアイテムを示す
    amount = current_user.cart_items.new(cart_item_params)
    amount.item_id = item.id
    amount.save
    redirect_to public_cart_items_path
  end

  # プライベート
  private

  def cart_item_params
    params.permit(:amount,:item_id,:customer_id,:user_id)
  end

end
