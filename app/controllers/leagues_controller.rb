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
    if current_user.token.nil?
      redirect_to(:signin) and return
    end

    all_users_leagues = fetch_all_users_leagues

    leagues = all_users_leagues["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]

    leagues.map do |league|
      league_info     = parse_league_info(league)
      league_keys     = parse_league_keys(league)
      league_settings = get_player_categories(league_keys)

      league_info.merge!(name: league_name)

      League.first_or_create(league_info)

      team_info_arr    = create_teams(league_info)


      @goalie_category = create_goalie_categories(league_settings, league_info)
      @player_category = create_player_categories(league_settings, league_info)
      @player_passport = create_passport_entry(team_info_arr, league_info)
    end


    redirect_to user_leagues_path(current_user)
  end

  def fetch_all_users_leagues
    HTTParty.get("#{@yahoo_root}users;use_login=1/games;game_keys=363/teams", headers:{
      "Authorization" => "Bearer #{@current_user.token}"
    })
  end

  def get_player_categories(league_keys)
    @player_categories ||= HTTParty.get("#{yahoo_root}league/#{league_keys}/settings", headers:{
      "Authorization" => "Bearer #{@current_user.token}"
    })
  end

  def league_name
    get_player_categories["fantasy_content"]["league"]["name"]
  end

  def parse_league_keys(league)
    league["team_key"].split('.t')[0]
  end

  def parse_league_info(league)
    {
      user_team: league["name"],
      user_logo: league["team_logos"]["team_logo"]["url"],
      sport: 'Hockey',
      user_id: @current_user.id,
      league_key: league["team_key"].split('.t')[0]
    }
  end

  def show
    @current_user = current_user
    @leagues = League.where(user_id: @current_user.id)
    @league_id = params[:id]
    puts @league_id.inspect
    @teams = Team.where(league_id: @league_id)
    # @teams_id = Team.where(league_id: league_id).pluck(:id)
    # @league_id = League.where(user_id: @current_user.id).pluck(:id)
  end

end
