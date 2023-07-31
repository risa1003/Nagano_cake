Rails.application.routes.draw do
  #会員側のルーティング設定
  root_to: 'homes#top'
  get 'orders/new'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'

  #管理者側のルーティング設定
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end

  namespace :admin do
    resources :items
  end

   # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  # 管理者側のルーティング設定
  namespace :admin do
    get 'items' => 'admin/items#index'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end