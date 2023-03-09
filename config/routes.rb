Rails.application.routes.draw do
  devise_for :users
  root to: "plants#home"
  get '/gardens/plants', to: 'gardens#show', as: 'plant'

  resources :plants
  resources :gardens, only: %i[create show]
end
