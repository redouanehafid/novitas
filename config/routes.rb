Rails.application.routes.draw do
  

  root 'pages#index'

  devise_for :users

  namespace :admin do
    resources :categories
    resources :formations
    resources :orders
    resources :newsletters
    resources :carrieres
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

  resources :newsletters, only: [:new, :create]
  resources :carrieres, only: [:new, :create]

  get 'tags/:tag', to: 'pages#formations', as: :tag
  get 'articles' => 'pages#articles'
  get 'formations' => 'pages#formations'
  get 'apropos' => 'pages#apropos'
  get 'expertise' => 'pages#expertise'
  get 'novitas' => 'pages#novitas'
  get 'contact' => 'pages#contact'
  post 'contact' => 'pages#sendmail'

end
