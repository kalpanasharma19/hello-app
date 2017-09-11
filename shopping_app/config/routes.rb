Rails.application.routes.draw do

  resources :products

  resources :sessions

  resources :customers do
    resources :delivery_addresses
  end

  get 'welcome/index'
  root 'welcome#index'
end
