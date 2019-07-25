Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :abilities
  resources :faction_keywords
  resources :keywords
  resources :models
  resources :units
  resources :wargear_options
  resources :weapons

  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  
end
