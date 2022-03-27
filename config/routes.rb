Rails.application.routes.draw do
  get 'cards/show'
  get 'welcome/index'
  root to: 'welcome#index'
  resources :products
  resources :order_items
  resource :card, only: :show

  devise_for :users
  ActiveAdmin.routes(self)
end
