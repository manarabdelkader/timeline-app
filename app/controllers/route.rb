Rails.application.routes.draw do
    resources :posts, only: [:create, :index] do
      resources :reviews, only: [:create]
    end
  
    get '/posts/top', to: 'posts#top'
  end