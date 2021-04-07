class Admin::HomesController < ApplicationController

  def top
    path = Rails.application.routes.recognize_path(request.referer)
    case params[:order_sort]
    when "1"
      @orders = Order.where(user_id: path[:id])
    else
      @orders = Order.all
    end
  end

end
