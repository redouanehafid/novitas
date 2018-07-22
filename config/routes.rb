Rails.application.routes.draw do
  
  root 'pages#index'

  devise_for :users

  namespace :admin do

    resources :categories
    resources :formations
    resources :orders

  	resources :posts do
  	  resources :comments
    end

  end

end
