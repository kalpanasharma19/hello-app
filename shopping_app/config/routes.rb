Rails.application.routes.draw do

  resources :products

  resources :sessions

  resources :customers do
    resources :delivery_addresses
    resources :shopping_cart_items
  end
  get 'shopping_cart_items/new'
  get 'shopping_cart_items/show'
  get 'welcome/index'
  root 'welcome#index'
end
