Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "plants#home"

  resources :plants
  resources :gardens
  resources :guides, only: %i[index show]
  resources :tags, only: %i[create destroy]
  resources :lists, only: :index
  resources :tasks

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
end
