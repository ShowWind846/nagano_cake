Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'

  namespace :public do
    get 'about',to: 'homes#about'
  end

end
