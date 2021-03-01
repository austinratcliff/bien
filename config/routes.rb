Rails.application.routes.draw do
  root 'reviews#index'

  resources :users

  resources :reviews do
    resources :comments
  end
end
