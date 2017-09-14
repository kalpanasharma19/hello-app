Rails.application.routes.draw do

  resources :products

  resources :sessions

  resources :customers do
    resources :delivery_addresses
    resources :shopping_cart_items
    resources :orders do
      resources :order_items
    end
  end
  get 'shopping_cart_items/new'
  get 'shopping_cart_items/show'
  post 'shopping_cart_items/:id/add' => "shopping_cart_items#add_quantity", as: "shopping_cart_item_add"
  post 'shopping_cart_items/:id/reduce' => "shopping_cart_items#reduce_quantity", as: "shopping_cart_item_reduce"
  post 'shopping_cart_items' => "shopping_cart_items#create"
  get 'orders/show'
  get 'welcome/index'
  root 'welcome#index'
end
