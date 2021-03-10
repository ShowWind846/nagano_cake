class Public::CustomersController < ApplicationController
  # customers = user であることを認識する。

  def show
    @customer = User.find(current_user.id)
  end

  def edit
    @customer = User.find(params[:id])
  end

  def update
    customer = User.find(params[:id])
    customer.update(customer_params)
    #binding.pry
    redirect_to public_customer_path(params[:id])
  end

  def withdrawl
  end

  def leave
    # おそらく、更新する。is_activeをfalseに。formで飛ばす。
    @user = User.find(current_user.id)
    @user.update(is_active: "false")
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:user).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number)
  end

end
