require "httparty"

class LeaguesController < ApplicationController
  def create
    @yahoo_root = yahoo_root
    @current_user = current_user

    user_leagues_full = HTTParty.get("#{@yahoo_root}users;use_login=1/games;game_keys=363/teams", headers:{
    "Authorization" => "Bearer #{@current_user.token}"
    })
    user_leagues_arr = user_leagues_full["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]
    user_leagues_arr.map do |league|
      league_info =
      {
        user_team: team["name"],
        user_logo: team["team_logos"]["team_logo"]["url"]
      }
      league_info[sport: 'Hockey']
      league_info[user_id: @current_user.id]
      league_key = team["team_key"].split('.t')[0]

      league_info[:league_name] = map_team.map do |team|
        league_settings = HTTParty.get("#{yahoo_root}league/#{team[:league_key]}/settings", headers:{
        "Authorization" => "Bearer #{@current_user.token}"
        })
        league_name = league_settings["fantasy_content"]["league"]["name"]
      end
    @league = League.create(id: league_key, league_info)
    end

  end
end
