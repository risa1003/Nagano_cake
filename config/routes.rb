Rails.application.routes.draw do
  #会員側のルーティング設定
  scope module: :public do
  root 'homes#top'
  get 'orders/new'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
  get 'check' => 'customers#check', as: 'check'
  end

  #管理者側のルーティング設定
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    resources :items
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