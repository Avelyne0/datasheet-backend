Rails.application.routes.draw do
  resources :abilities
  get 'sessions/new'
  resources :faction_keywords
  resources :keywords
  resources :models
  resources :units
  resources :users
  resources :wargear_options
  resources :weapons
end
