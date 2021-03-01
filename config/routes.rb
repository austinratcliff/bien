Rails.application.routes.draw do
  root 'reviews#index'

  resources :users
  resource :session

  resources :reviews do
    resources :comments
  end
end
