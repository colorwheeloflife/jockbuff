Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root to: 'welcome#welcome'

 resources :users do
   resources :leagues do
     resources :teams, only: [:index, :show, :create] do
     end
   end
 end

 resources :analysis, only: [:index, :show]

 get '/users/:user_id/leagues' => 'leagues#create'

 get '/users/:user_id/leagues/:league_id/players' => 'players#index', :as => :players
 get '/users/:user_id/leagues/:league_id/compares' => 'compares#index', :as => :compares

 get '/users/:user_id/leagues/:league_id/teams' => 'teams#index'
 post '/users/:user_id/leagues/:league_id/teams' => 'teams#create'
 post '/users/:user_id/leagues/:id' => 'teams#create'

 get '/auth/:provider/callback' => 'sessions#create'

 get '/signin' => 'sessions#new', :as => :signin

 get '/auth/failure' => 'sessions#failure'

 get '/update_players_table' => 'players#create'


 delete '/signout' => 'sessions#destroy'

end
