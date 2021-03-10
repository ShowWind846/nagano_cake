Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'

  namespace :public do
    get 'about',to: 'homes#about'
    resources :customers, only:[:show,:update,:edit]
    get 'withdrawl',to: 'customers#withdrawl'
    patch 'leave',to: 'customers#leave'
    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:update,:destroy,:create]
    delete 'destroy_all', to: "cart_items#destroy_all"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:index,:edit,:update,:destroy,:update,:create,:new,:show]
    resources :genres, only:[:index,:edit,:update,:create]
    resources :customers, only:[:index,:edit,:update,:show]
  end

end
