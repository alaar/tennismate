Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :matches, only: [:create]
  end

  resources :matches, only: [:show, :update, :edit]
  # get 'matches/show'

  # get 'matches/create'

  # get 'matches/update'

  # get 'users/show'

  # get 'users/index'

  # get 'pages/home'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
