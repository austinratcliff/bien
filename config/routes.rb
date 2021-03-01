Rails.application.routes.draw do
  root 'reviews#index'

  resources :users
  resources :sessions

  resources :reviews do
    resources :comments
  end
end
