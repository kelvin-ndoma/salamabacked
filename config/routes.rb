Rails.application.routes.draw do
  # Likes routes
  get 'likes/create'
  get 'likes/destroy'

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

  # Blogs routes
  resources :blogs do
    member do
      post 'toggle_like'
    end
  end

  # Custom route for user's blogs
  get '/my_blogs', to: 'blogs#my_blogs', as: 'my_blogs'
end
