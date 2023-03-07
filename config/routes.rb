Rails.application.routes.draw do
  get 'plants/home'
  devise_for :users
  root to: "plants#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
