Rails.application.routes.draw do
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/google_oauth2/callback' => 'sessions#omniauth'

  # get '/user/:id' => 'shows#show'
  # get 'shows' => 'shows#shows'


  resources :shows do
    resources :notes, only: [:new, :index]
  end
  resources :notes
  resources :users, only: [:show]
  end
