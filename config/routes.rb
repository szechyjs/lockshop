LockShop::Application.routes.draw do
  devise_for :users

  resources :cores

  resources :keytypes

  resources :keys

  resources :keyways

  get "home/index"

  root :to => "home#index"
end
