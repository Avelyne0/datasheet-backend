Rails.application.routes.draw do  
  resources :abilities, only: [:create, :show, :index]
  resources :faction_keywords, only: [:create, :show, :index]
  resources :keywords, only: [:create, :show, :index]
  resources :models, only: [:create, :show, :index]
  resources :units, only: [:create, :show, :index]
  resources :wargear_options, only: [:create, :show, :index]
  resources :weapons, only: [:create, :show, :index]

  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  
end
