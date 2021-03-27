class Public::ItemsController < ApplicationController
  include Searchform

  def index
    @genre_name = Genre.all.map {|genre_name| [genre_name.name,genre_name.id]}
    if @genre_id == nil
      @items = Item.all
    else
      @items = Item.where(genre_id: @genre_id)
    end
  end

  def search
    @genre_name = Genre.all.map {|genre_name| [genre_name.name,genre_name.id]}
    @genre_id = params[:genre]
    @items = Item.where(genre_id: @genre_id)
    #binding.pry
    render :index
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @cart_item.item_id = @item.id
  end


end
