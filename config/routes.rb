Rails.application.routes.draw do

  match "/404", :to =>  "errors#not_found", :via => :all
  match "/500", :to =>  "errors#internal_server_error", :via => :all

  devise_for :users

  # root to: 'pages#home' (need to delete this one, it's added on line 21)

  resources :users, only: [:index, :show, :update, :edit] do
    resources :matches, only: [:create]
  end

  resources :matches, only: [:show, :update, :index]

  resources :courts, only: [:show, :index]
  resources :availabilities, only: [:index]

  patch "/availabilities", to: "availabilities#update", as: :update_availabilities


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
