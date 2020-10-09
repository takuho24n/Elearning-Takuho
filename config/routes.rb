Rails.application.routes.draw do
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  root "pages#home"

  get '/signup', to: 'users#new'
end
