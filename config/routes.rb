Rails.application.routes.draw do
  root 'pages#home'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'

  # resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # /login
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  #Category
  #get '/category', to: 'categories#show'
  resources :categories
  resources :words

  # Follow Stats
  resources :users do
    member do
      get :following, :followers
    end
  end

  # For follow and unfollow
  resources :relationships, only: [:create, :destroy]

  #admin
  #  get '/admin', to: 'admin/categories#index'
  #  post '/admin/categories/:id/edit', to: 'admin/categories#edit'
  #  patch '/admin/categories/:id/edit', to: 'admin/categories#update'
  #  get '/admin/categories/:id/edit', to: 'admin/categories#new'

  namespace :admin do
    #resources :categories
    resources :categories do
      resources :words do
      end
    end
  end
  
  resources :categories do
    member do
      get :titles, :descriptions
  end
end

end
