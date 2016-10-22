Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'compares/show'
  get 'owners/show'
  get 'players/show'
  get 'players/index'
  get 'leagues/new'
  get 'leagues/index'
  get 'leagues/show'


  root to: 'welcome#welcome'

  resources :users
  resources :leagues, only: [:index, :show]
  resources :owners, only: [:show]
  resources :players, only: [:index, :show]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

end
