class Public::AddressesController < ApplicationController
  include Searchform

  def index
    @addresses = Address.where(user_id: current_user.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
    #binding.pry
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :user_address, :user_id)
  end

end
