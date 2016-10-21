Rails.application.routes.draw do
  get 'compares/show'

  get 'owners/show'

  get 'players/show'

  get 'players/index'

  get 'leagues/new'

  get 'leagues/index'

  get 'leagues/show'


  root to: 'welcome#welcome'

  resources :users
  resources :leagues
  resources :owners, only: [:show]
  resources :players, only: [:index, :show]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end