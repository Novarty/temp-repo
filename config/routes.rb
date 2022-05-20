Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  resources :products
  resources :order_items
  resource :card, only: :show
  post 'card_submit', to: 'cards#submit'

  devise_for :users
  ActiveAdmin.routes(self)
end
