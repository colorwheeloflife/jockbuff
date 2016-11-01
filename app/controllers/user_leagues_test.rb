
require 'httparty'
    user_leagues_full = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=363/teams", headers:{
    "Authorization" => "Bearer #{User.first.token}"
    })
    puts user_leagues_full
