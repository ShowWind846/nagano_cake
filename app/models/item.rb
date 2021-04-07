class Item < ApplicationRecord

  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

# ジャンル検索機能で使用する配列をここで定義している
  def genre_choices
    Item.all.map{|item| [item.name,item.id]}
  end

  def g_items
    item_first = Item.first
    @item_id = params[item_id] || item_first
    @aitems = Item.where(id: @item_id)
  end

end
