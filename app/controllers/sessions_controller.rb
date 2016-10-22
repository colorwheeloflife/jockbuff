require 'byebug'

class SessionsController < ApplicationController

  def new
    redirect_to '/auth/yahoo'
  end

  def create
    auth = request.env["omniauth.auth"]
    puts "\n\n\n\nAUTH: #{auth}\n\n\n"
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # reset_session

    session[:user_id] = user.id
    null = nil

    user_info = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=363/teams", headers:{
        "Authorization" => "Bearer 2TTkCTSbvwj34g9IYYPTw6R5zfIO5XSCAyCr.GmmwzdGDBVlypncPfp6UoIIirro7PznVMtvsRyVY.zr1bBIhpMV.RRWp8cLXt_TfpzMBhM0ShwB.OyORY6LGB2JXV6Yys5jR.QOE8ilOXFMB6pcmAu7tOEadGE39UtmZunB3ebwij6QicIlMrlhuR3f32rlmE0rqT6r.lG59v6d8QcpG4DOZCYHcHoEHagROEKJ9rrryrBJVMc2Zb9DNKcj3wyFwTKvDFi8jNbraaEXj8GlGjju8h1xm0kSZzV8wVbodovgnnYMNdLbYa4VhC855f4WtDhb9RWgwXzOJCFrS4hpcfCiEOsonSZHfHVjWJIW0k.5e7oWbzYdB1fx70KIBZ.ZJPNREJ9lE6iBmnqtTYHA5NoI5nODhRCTA2yEe0KuVZYB1D6MhGznRBo8e_6XOrWTM4VxVlv8UlO5d9d_1f0w0zMb2p3xXja9HHvD5lZ88b0bapmtFpnyyFQnVQsDMAP19FSVcCCUDIWM40nTM9XXQFGhEzuicxBShYDqbKlPKP_nqvL0pZv4Cv2hIl3SUi9UBiVvIX639z0f6oeg7q_lCty4EUcx1r7F3v6xyUck.OANz.RtriHvxHMxBkbIdG036AXDZqBaEJjegMzNG_FxF_yq3wEb3ZqORXWGVRf7kdqDjC1mYKCorv9lTxA1.W8RRrRojtJtaAnknYmLWaxJpqmdpPPn7ZiblK_vyWNYenZQFfkn.VRIvPzwfan.TEM6o3Q7L1rx8rEOag--"
        })
    # byebug
    team_info = user_info["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]
    map_team = team_info.map do |team|
      {
        team_key: team["team_key"],
        team_name: team["name"]
        league_key:  team["team_key"].split('.t')[0],
        sport: 'Hockey',
        logo: team["team_logos"]["team_logo"]["url"]
      }
    end

    league_names = map_team.map do |team|
    league_settings = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/#{team[:league_key]}/settings", headers:{
        "Authorization" => "Bearer 2TTkCTSbvwj34g9IYYPTw6R5zfIO5XSCAyCr.GmmwzdGDBVlypncPfp6UoIIirro7PznVMtvsRyVY.zr1bBIhpMV.RRWp8cLXt_TfpzMBhM0ShwB.OyORY6LGB2JXV6Yys5jR.QOE8ilOXFMB6pcmAu7tOEadGE39UtmZunB3ebwij6QicIlMrlhuR3f32rlmE0rqT6r.lG59v6d8QcpG4DOZCYHcHoEHagROEKJ9rrryrBJVMc2Zb9DNKcj3wyFwTKvDFi8jNbraaEXj8GlGjju8h1xm0kSZzV8wVbodovgnnYMNdLbYa4VhC855f4WtDhb9RWgwXzOJCFrS4hpcfCiEOsonSZHfHVjWJIW0k.5e7oWbzYdB1fx70KIBZ.ZJPNREJ9lE6iBmnqtTYHA5NoI5nODhRCTA2yEe0KuVZYB1D6MhGznRBo8e_6XOrWTM4VxVlv8UlO5d9d_1f0w0zMb2p3xXja9HHvD5lZ88b0bapmtFpnyyFQnVQsDMAP19FSVcCCUDIWM40nTM9XXQFGhEzuicxBShYDqbKlPKP_nqvL0pZv4Cv2hIl3SUi9UBiVvIX639z0f6oeg7q_lCty4EUcx1r7F3v6xyUck.OANz.RtriHvxHMxBkbIdG036AXDZqBaEJjegMzNG_FxF_yq3wEb3ZqORXWGVRf7kdqDjC1mYKCorv9lTxA1.W8RRrRojtJtaAnknYmLWaxJpqmdpPPn7ZiblK_vyWNYenZQFfkn.VRIvPzwfan.TEM6o3Q7L1rx8rEOag--"
        })
    league_name = league_settings["fantasy_content"]["league"]["name"]
    end

    full_league = map_team.map.with_index { |hash, team| hash['league_name'] = league_names[team]; hash}

    pp full_league
    pp map_team
    pp league_names

    @leagues = League.create(full_league)
    redirect_to leagues_path, :notice => 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end