Rails.application.routes.draw do
  #商品一覧表示機能実装開始
  devise_for :users
  root to: 'items#index'
  resources :items
end
