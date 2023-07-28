Rails.application.routes.draw do
  # Signup
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  # Login
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  # Current User
  get '/current_user', to: 'sessions#current_user'

  # Logout
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Activities routes
  resources :activities do
    resources :comments, only: [:create, :destroy]
    resources :ratings, only: [:create, :destroy]
  end

  # User routes
  resources :users, only: [:show, :create, :destroy]
end
