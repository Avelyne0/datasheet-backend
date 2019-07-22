Rails.application.routes.draw do

  root 'welcome#index'

  resources :abilities
  resources :faction_keywords
  resources :keywords
  resources :models
  resources :units
  resources :users
  resources :wargear_options
  resources :weapons
end
