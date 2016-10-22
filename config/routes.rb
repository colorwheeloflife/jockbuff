Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#welcome'

  resources :users
  resources :leagues, only: [:index, :show]
  resources :owners, only: [:show]
  resources :players, only: [:index, :show]
  resources :compares, only: [:index, :show]
  resources :analysis, only: [:index, :show]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/auth/failure' => 'sessions#failure'

  delete '/signout' => 'sessions#destroy'

end
