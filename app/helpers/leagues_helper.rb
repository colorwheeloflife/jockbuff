module LeaguesHelper
  include GoalieCategoriesHelper
  include PlayerCategoriesHelper

  def current_user_leagues(user_id)
    League.where(user_id: user_id)
  end

  def create_leagues
    @yahoo_root = yahoo_root
    @current_user = current_user

    user_leagues_full = HTTParty.get("#{@yahoo_root}users;use_login=1/games;game_keys=363/teams", headers:{
    "Authorization" => "Bearer #{@current_user.token}"
    })
    # return redirect_to(:signin) if(user_leagues_full["error"])

    user_leagues_arr = user_leagues_full["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]

    user_leagues_arr.map do |league|
      league_info = {
          user_team: league["name"],
          user_logo: league["team_logos"]["team_logo"]["url"],
          sport: 'Hockey',
          user_id: @current_user.id,
          league_key: league["team_key"].split('.t')[0]
        }
      league_keys = league["team_key"].split('.t')[0]
      league_settings =  HTTParty.get("#{yahoo_root}league/#{league_keys}/settings", headers:{
        "Authorization" => "Bearer #{@current_user.token}"
      })
      league_name = league_settings["fantasy_content"]["league"]["name"]
      league_info.merge!(name: league_name)
      @league = League.create(league_info)
      @player_category = create_player_categories(league_settings, league_info)
      @goalie_category = create_goalie_categories(league_settings, league_info)
    end
  end

end
