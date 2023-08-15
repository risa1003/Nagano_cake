Rails.application.routes.draw do
  get 'homes/top'
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

  #会員側のルーティング設定
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, :cart_items, :addresses, :orders
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/introduction/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/introduction' => 'customers#update', as: 'customer'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    get 'customers/check' => 'customers#check', as: 'check'
    delete 'destroy_all' => 'cart_items#destroy_all'
    post 'confirm' => 'orders#confirm', as: 'confirm'
    get 'thanks' => 'orders#thanks', as: 'thanks'
  end

  #管理者側のルーティング設定
  namespace :admin do
    root 'homes#top', as: :admin_root
    resources :items, :customers, :orders, :order_details, :genres
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end