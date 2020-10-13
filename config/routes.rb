Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do

  #follow and unfollow
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'

   
  resources :users do
    member do
    get :following, :followers
    end
  end

  
end
