Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#welcome'

  resources :users do
    resources :leagues, only: [:index, :show] do
      resources :teams, only: [:index, :show, :create] do
        resources :players, only: [:index]
          resources :compares, only: [:index]
      end
    end
  end


  resources :analysis, only: [:index, :show]

  get '/users/:user_id/leagues' => 'leagues#create'

  get '/users/:user_id/leagues/:leagueid/players' => 'players#index', :as => :players
  get '/users/:user_id/leagues/:leagueid/compares' => 'compares#index', :as => :compares


  post '/users/:user_id/leagues/:league_id/teams' => 'teams#create'
  post '/users/:user_id/leagues/:id' => 'teams#create'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/signin' => 'sessions#new', :as => :signin

  get '/auth/failure' => 'sessions#failure'

  get '/update_players_table' => 'players#create'


  delete '/signout' => 'sessions#destroy'

end
