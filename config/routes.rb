Rails.application.routes.draw do
  #会員側のルーティング設定
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, :customers, :cart_items, :addresses, :orders
    get 'mypage', to: 'public/customers#show', as: :customer
    get 'cart_items/destroy_all'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
    get 'check' => 'customers#check', as: 'check'
    post 'confirm' => 'orders#confirm', as: 'confirm'
    get 'thanks' => 'orders#thanks', as: 'thanks'
  end

  #管理者側のルーティング設定
  namespace :admin do
    #root 'homes#top'
    resources :items, :customers, :orders, :order_details, :genres
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