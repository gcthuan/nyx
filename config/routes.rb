Rails.application.routes.draw do
  root 'api/orders#index'
  namespace :api, {default: 'json'} do
    resources :orders
    resources :products
  end
end
