class Admin::CustomersController < ApplicationController

  def index
    @customers = User.all
  end

  def show
    @customer = User.find(params[:id])
  end

  def edit
    @customer = User.find(params[:id])
  end

  def update
    customer = User.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:user).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_active)
  end

end
