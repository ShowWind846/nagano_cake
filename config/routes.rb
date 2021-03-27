Rails.application.routes.draw do

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end

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
    resources :items, only:[:index,:show] do
      collection do
        get :search
      end
    end
    resources :cart_items, only:[:index,:update,:destroy,:create]
    delete 'destroy_all', to: "cart_items#destroy_all"
    #Order_controller
    post 'orders/confirm', to: 'orders#confirm'
    resources :orders, only: [:show,:new,:create,:index] do
      collection do
        get :complete
      end
    end
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:index,:edit,:update,:destroy,:update,:create,:new,:show]
    resources :genres, only:[:index,:edit,:update,:create]
    resources :customers, only:[:index,:edit,:update,:show]
    resources :orders, only:[:index,:create,:edit,:update]
  end

end
