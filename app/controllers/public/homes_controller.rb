class Public::HomesController < ApplicationController
  include Searchform

  def top
    @new_items = Item.last(4)
  end

  def about
  end

end
