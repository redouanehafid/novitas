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

  resources :formations, only: [:show] do
    resources :orders
  end

  resources :posts, only: [:show] do
    resources :comments
  end

  get 'tags/:tag', to: 'pages#formations', as: :tag
  get 'articles' => 'pages#articles'
  get 'formations' => 'pages#formations'
  get 'apropos' => 'pages#apropos'
  get 'expertise' => 'pages#expertise'
  get 'contact' => 'pages#contact'
  get 'optima' => 'pages#optima'

end
