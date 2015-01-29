Rails.application.routes.draw do

  devise_for :users
  
  resources :businesses do
    resources :reviews, except: [:show, :index]
  end

  root 'businesses#index'

end
