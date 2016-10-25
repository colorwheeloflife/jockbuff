class OwnersController < ApplicationController

  def create
    league_id = params[:id]
    @owner_info_arr = league_call(league_id)
    @owner_info_arr.map do |owner|
      owner_info = {}
      owner_info.merge!(league_id: league_id)
      onwer_info.merge!(team_key: owner["team_key"])
      owner_info.merge!(team_name: owner["name"])
      owner_info.merge!(team_key:  owner["team_id"].to_i)
      user_team = League.where(id: params[:id]).select(:user_team)
      if user_team = onwer["name"]
        ownership = true
      else
        ownership = false
      end
      owner_info.merge!(ownership_status: ownership)

      @owner = Owner.create(owner_info)
      @player_passport = PlayerPassport.create(owner_info[:league_id])
    end
    redirect_to user_league_path
  end
end
