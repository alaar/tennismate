Rails.application.routes.draw do
  get 'matches/show'

  get 'matches/create'

  get 'matches/update'

  get 'users/show'

  get 'users/index'

  get 'pages/home'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
