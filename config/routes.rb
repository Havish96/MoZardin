Rails.application.routes.draw do
  devise_for :users
  root to: "plants#home"

  resources :plants
end
