Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  resources :products
  devise_for :users
  ActiveAdmin.routes(self)
end
