Rails.application.routes.draw do




  namespace :public do
    get 'new_gourmets/index'
  end
  namespace :public do
    get 'rankings/index'
    get 'rankings/show'
  end
  namespace :public do
    get 'searches/index'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/confirm'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'sale_areas/index'
    get 'sale_areas/show'
  end
  namespace :public do
    get 'categories/index'
    get 'categories/show'
  end
  namespace :public do
    get 'items/show'
  end
  namespace :public do
    get 'stores/index'
    get 'stores/show'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'stores/index'
    get 'stores/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
