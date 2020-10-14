Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'


  #follow and unfollow
  resources :users do
    member do
      get :following, :followers
    end
  end
 
end
