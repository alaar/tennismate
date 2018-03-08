Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

<<<<<<< HEAD
  resources :users, only: [:index, :show, :update, :edit] do
=======
  resources :users, only: [:index, :show, :update] do
>>>>>>> master
    resources :matches, only: [:create]
  end

  resources :matches, only: [:show, :update]

  resources :courts, only: [:show, :index]

  # get 'matches/show'

  # get 'matches/create'

  # get 'matches/update'

  # get 'users/show'

  # get 'users/index'

  # get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
