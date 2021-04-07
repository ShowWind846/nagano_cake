class Admin::ItemsController < ApplicationController
# 商品一覧機能
def index
    @items = Item.page(params[:page]).per(10)
end
# 商品投稿機能
def new
    @item = Item.new
    @genres = Genre.all
end

def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
end
# 商品編集機能
def edit
    @item = Item.find(params[:id])
end

def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
end
# 商品詳細機能
def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
    @currency = @item.price*1.1
    @item_price = @currency.floor
    @prices = @item_price.to_s(:delimited)
    if @item.is_active == true
        puts "販売中"
    else
        puts "販売中止中"
    end
end

# ストロングパラメータ
private

def item_params
    params.require(:item).permit(:id,:genre_id,:name,:image,:introduction,:price,:is_active)
end

end
