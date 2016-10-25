class PlayersController < ApplicationController

  def create
    @current_user = current_user
    full_player_arr = []
    i = 0
    while i < 1888 do
      full_player_arr.push(i)
      i = i + 25
    end
    players_full = full_player_arr.map do |start|
      players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91004/players;start=#{start}", headers:{
          "Authorization" => "Bearer #{@current_user.token}"
        })
      player_arr = players["fantasy_content"]["league"]["players"]["player"]
      player_arr.map do |player|
        player_details = {
          id: player["player_id"],
          name: player["name"]["full"],
          pro_team: player["editorial_team_abbr"],
          eligible_positions: player["eligible_positions"]["position"],
          type: player["position_type"]
        }
        @player = Player.create(player_details)
      end
    end


  end

end
