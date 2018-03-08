Rails.application.routes.draw do
  get 'courts/show'

  get 'courts/index'

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :matches, only: [:create]
  end

  resources :matches, only: [:show, :update]

  resources :courts, only: [:show, :index]

  authenticated :user do
    root 'users#index', as: :authenticated_root
  end

  root to: 'pages#home'
  # get 'matches/show'

  # get 'matches/create'

  # get 'matches/update'

  # get 'users/show'

  # get 'users/index'

  # get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
