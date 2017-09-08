Rails.application.routes.draw do

  resources :products

  resources :sessions

  resources :customers

  get 'welcome/index'
  root 'welcome#index'
end
