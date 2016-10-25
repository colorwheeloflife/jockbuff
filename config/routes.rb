Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#welcome'

  resources :users do
    resources :leagues do
      resources :owners, only: [:index, :show] do
        resources :players, only: [:index]
      end
    end
  end

  resources :players
  resources :compares, only: [:index, :show]
  resources :analysis, only: [:index, :show]

  post '/users/:user_id/leagues' => 'leagues#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/auth/failure' => 'sessions#failure'

  delete '/signout' => 'sessions#destroy'

end
