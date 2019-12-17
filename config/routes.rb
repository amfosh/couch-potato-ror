Rails.application.routes.draw do
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/google_oauth2/callback' => 'sessions#omniauth'
  get '/just_added' => 'shows#just_added'


  resources :shows, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :shows do 
    resources :notes, only: [:new, :create, :index, :show, :edit]
  end
  resources :shows do
    get :just_added, on: :collection
  end
  resources :notes
  resources :users, only: [:show]
  end
