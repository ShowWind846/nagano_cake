class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Searchform

  $genre_name =  Genre.all.map {|genre_name| [genre_name.name,genre_name.id]}

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:item_id,:telephone_number,:is_active])
  end
end
