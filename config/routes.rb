Rails.application.routes.draw do
  root 'pages#home'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # /login
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  #Category
  get '/category', to: 'categories#show'

  # Follow Stats
  resources :users do
    member do
      get :following, :followers
    end
  end

  # For follow and unfollow
  resources :relationships, only: [:create, :destroy]

  #admin
  resources :admins, only: [:index, :show]
    namespace :admin do
      resources :admins, only: [:index, :show, :create, :new, :edit, :destroy]
    end
  
end
