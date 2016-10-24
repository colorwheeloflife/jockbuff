class OwnersController < ApplicationController

  def create
    @current_user = current_user

    league_full = HTTParty.get("#{@yahoo_root}league/#{league_key}/settings", headers:{
      "Authorization" => "Bearer #{token}"
    })
    num_teams = league_full["fantasy_content"]["league"]["num_teams"]
    team_arr = (1..num_teams).to_a
    team_arr.each do |team|
      owner_info = HTTParty.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players", headers:{
      "Authorization" => "Bearer #{token}"
      })
      owner = {}
      owner_info = owner_info["fantasy_content"]["team"]
      owner.merge!(team_name: owner_info["name"])
      team_id = owner_info["team_id"].to_i
      player_info = owner_info["roster"]["players"]["player"]
      players = playerr_info.map do |t|
        players = {
        player_id: t["player_id"],
        current_position: t["selected_position"]["position"]
        }
      end
      owner.merge!(players: players)
      @owner = Owner.create(owner)
    end
  end
end
