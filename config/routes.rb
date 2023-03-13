Rails.application.routes.draw do
  devise_for :users
  root to: "plants#home"


  resources :plants
  resources :gardens, only: %i[create show index new destroy]
  resources :guides, only: %i[index show]
  resources :tags, only: %i[create]

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
end
