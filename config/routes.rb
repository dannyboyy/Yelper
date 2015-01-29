Rails.application.routes.draw do
  resources :reviews

  devise_for :users
  resources :businesses

  root 'businesses#index'
end
