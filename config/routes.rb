Rails.application.routes.draw do

  devise_for :users

  # root to: 'pages#home' (need to delete this one, it's added on line 21)

  resources :users, only: [:index, :show, :update, :edit] do
    resources :matches, only: [:create]
  end

  resources :matches, only: [:show, :update, :index]

  resources :courts, only: [:show, :index]


  authenticated :user do
    root 'users#index', as: :authenticated_root
  end

  root to: 'pages#home'

  # get 'matches/show'


  # get 'matches/update'

  # get 'users/show'

  # get 'users/index'

  # get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
