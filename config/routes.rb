Rails.application.routes.draw do
  devise_for :users
  root to: "plants#home"


  resources :plants
  resources :gardens, only: %i[create show index new]

end
