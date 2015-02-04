Rails.application.routes.draw do

  devise_for :users
  
  resources :businesses do
    resources :reviews, except: [:show, :index] do
      member do
        put "like", to:    "links#upvote"
        put "dislike", to: "links#downvote"
      end
    end
  end

  root 'businesses#index'

end
