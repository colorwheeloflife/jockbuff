require "httparty"

class LeaguesController < ApplicationController
  include GoalieCategoriesHelper
  include PlayerCategoriesHelper
  include PlayerPassportHelper
  include TeamsHelper

def index
  @current_user = current_user
  @leagues = League.where(user_id: @current_user.id)
end

  def create
    @yahoo_root = yahoo_root
    @current_user = current_user

    user_leagues_full = HTTParty.get("#{@yahoo_root}users;use_login=1/games;game_keys=363/teams", headers:{
    "Authorization" => "Bearer #{@current_user.token}"
    })
    return redirect_to(:signin) if(user_leagues_full["error"])

    user_leagues_arr = user_leagues_full["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]

    user_leagues_arr.map do |league|
      league_info =
        {
          user_team: league["name"],
          user_logo: league["team_logos"]["team_logo"]["url"],
          sport: 'Hockey',
          # type: league["league_scoring_type"],
          user_id: @current_user.id,
          league_key: league["team_key"].split('.t')[0]
        }
      league_keys = league["team_key"].split('.t')[0]
      league_settings =  HTTParty.get("#{yahoo_root}league/#{league_keys}/settings", headers:{
        "Authorization" => "Bearer #{@current_user.token}"
      })
      league_name = league_settings["fantasy_content"]["league"]["name"]
      league_info.merge!(name: league_name)
      unless League.where(league_info).exists?
      @league = League.create(league_info)
      end
      team_info_arr = create_teams(league_info)
      @player_category = create_player_categories(league_settings, league_info)
      @player_passport = create_passport_entry(team_info_arr, league_info)
    end
    redirect_to user_leagues_path(current_user)
  end

  def show
    @current_user = current_user
    @leagues = League.where(user_id: @current_user.id)
    @league_id = params[:id]
    puts @league_id.inspect
    @teams = Team.where(league_id: @league_id)
  end

end
