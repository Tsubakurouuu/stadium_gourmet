Rails.application.routes.draw do

  #管理者
  namespace :admin do
    root to: 'homes#top'

    devise_for :stores, skip: [:registrations, :passwords], controllers: {
      sessions: 'admin/sessions'
    }

    resources :stores, only: [:index, :show] do
      resources :items, except: [:index]
      resources :orders, only: [:index, :show, :update]
      resources :data_graphs, only: [:index]
    end

  end

  #顧客
  scope module: :public do
    root to: 'homes#top'

    resources :stores, only: [:index, :show] do
      resources :items, only: [:show]
    end

    resources :categories, only: [:index, :show]
    resources :sale_areas, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :create]
    resources :searches, only: [:index]
    resources :rankings, only: [:index, :show]
    resources :new_gourmets, only: [:index]

    get 'orders/confirm' => 'orders#new'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
