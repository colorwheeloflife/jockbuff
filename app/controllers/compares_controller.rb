class ComparesController < ApplicationController

  def index
    @current_user_players = GetCurrentUserTeamInfo.new.get_roster(params[:league_id])
    @user_team_name = GetCurrentUserTeamInfo.new.get_team_name(params[:user_id], params[:league_id])
  end

end
