Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :shows, only: [:new, :create, :show, :edit, :update]
  resources :notes, only: [:create, :edit]
  resources :watched
end
