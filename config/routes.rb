Rails.application.routes.draw do
  get 'courts/show'

  get 'courts/index'

  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:index, :show, :update] do
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
