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
        "Authorization" => "Bearer Bgb63rWbvwhhWNffda3CYKUF4REVY9tzOEqDn0ukaNnqzO7Ppzy._0K_SupqC356UKGMLET2rVQnHos6Twao.EGS1jtmk8qBKfBqHLvyJ3n8Jb3.KCmkIxGjVwDQVw8JWusGywQBE67KIVGCoVSSTBeshUP2Tx0uW.Bw.IaMDHrrsI2.GmI4KbqwvO823l3HKeYkQq6DKReHhGRv8Vyschlo_kMYZ.KLuad3nIghzlrUtvl_Dgf307EnOqzOuEA4LJu7LVHv6uH0DDkYpWgnh1FHtbzHgY.aEOksS539NTHUBUngo242O.iV7bZdCTWxXpxK6io6M9Pmvh36UunQJQOz30LBZZ6WL1UiNYDr9RCWaqlBmt8EsHZ.zU8N8yddpy7yAo7CemHhd.TqPXyYhyAnoYvpAPJiST21EdRcrh6ISFvyzaQZwLDdur.ratFW2U0PZ9RUyvcuzfm96yqA3XFUfvUokgQT0SWjqa7XYVrbJzsUGf4T0xTz1iHoeQWNZt9uMK5IHE06O1Jw6gJ_TzY12_Ym_DReB.zDNxcawW9DjoGUv.D3AhPVBwm7RKqvpQelnb20kBl4oOezpCVUCCz1IVPVLcrAPjNewWJDvhwQmVEUrlF5gmRzZfNlmunVk4CB9mYMut3ZzI6nLczR_8i.EqVoMvpbEAcvVZciIuLL771GDiLpfJc_GbDFj2R.XqJISVxuy5Er4Ihmr8ZEy_DlQANQNed_zeyRBSy3q7Ah9vBI3AUVuqbxcG.VV_HACOpEZ.WmkNrZGA--"
        })
        league_name = league_settings["fantasy_content"]["league"]["name"]
      end
    @league = League.create(id: league_key, league_info)
    end

  end
end
