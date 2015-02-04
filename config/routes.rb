Rails.application.routes.draw do

  devise_for :users
  
  resources :businesses do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

  root 'businesses#index'

end
