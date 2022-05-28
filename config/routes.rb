Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboards#root"

  resources :users
  resources :hospitals
  resources :governorates
  resources :cities
  resources :patients
  resources :diseases
  resources :cases

  get '/auth/:provider/callback', to: 'callbacks#github'
end
