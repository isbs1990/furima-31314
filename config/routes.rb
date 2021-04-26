Rails.application.routes.draw do
  #deviseをインストールにより、下記部分が追加された
  devise_for :users
  root to: 'items#index'
  resources :items
end
