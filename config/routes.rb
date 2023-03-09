Rails.application.routes.draw do
  devise_for :users
  root to: "plants#home"

  resources :plants
  resources :gardens
  resources :guides, only: %i[index show]
end
