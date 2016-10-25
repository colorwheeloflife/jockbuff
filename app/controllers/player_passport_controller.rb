class PlayerPassportController < ApplicationController

  def create (leauge_id)
    @team_info_arr = league_call(league_id)
    @team_info_arr.map do |team|
      player_info = owner_info["roster"]["players"]["player"]
      entry = player_info.map do |t|
      entry = {
      player_id: t["player_id"],
      current_position: t["selected_position"]["position"]
      }
          league_full = HTTParty.get("#{@yahoo_root}league/#{league_key}/settings", headers:{
      "Authorization" => "Bearer #{token}"
      })
      num_teams = league_full["fantasy_content"]["league"]["num_teams"]
      team_arr = (1..num_teams).to_a
      team_arr.each do |team|
        owner_info = HTTParty.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players", headers:{
        "Authorization" => "Bearer #{token}"
        })
      end
    end
  end

