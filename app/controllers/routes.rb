Rails.application.routes.draw do
    post '/signup', to: 'auth#signup'
    post '/login', to: 'auth#login'
    resources :posts, only: [:create, :index] do
      resources :reviews, only: [:create]
    end
  
    get '/posts/top', to: 'posts#top'
  end