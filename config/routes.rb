Rails.application.routes.draw do
  #管理者
  namespace :admin do
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
    get 'homes/faq' => 'homes#faq'
    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    devise_scope :customer do
      post 'customers/guest_sign_in', to: 'sessions#guest_sign_in'
    end

    resources :stores, only: [:show] do
      resources :items, only: [:show]
    end

    get 'orders/confirm' => 'orders#error'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    resources :categories, only: [:show]
    resources :sale_areas, only: [:show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :searches, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
