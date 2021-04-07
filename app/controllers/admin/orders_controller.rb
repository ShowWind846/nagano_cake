class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
        @order_details = OrderDetail.where(order_id: @order.id)
        @order_status = [["入金待ち",1],["入金確認",2],["製作中",3],["発送準備中",4],["発送済み",5]]
        @production_status = [["入金待ち",0],["制作待ち",1],["製作中",2],["製作完了",3],["着手不可",4]]
        @sum = 0
    end

    def update
        @order = Order.find(params[:id])
        @order.user = User.find(@order.user_id)
        @order.update(order_params)
        #選択肢によって分岐させる必要がある。
            if order_params[:order_status] == "2"
                @order_details = OrderDetail.where(order_id: @order.id)
                @order_details.each do |order_detail|
                    order_detail.update(production_status: 1)
                end
            end
        redirect_to admin_order_path(params[:id])
    end

    private

    def order_params
        params.require(:order).permit(:order_status, :production_status)
    end

end
