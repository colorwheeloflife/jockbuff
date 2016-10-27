class TeamsController < ApplicationController

  def create
  end

  def show
    @current_user = current_user
    leagues = League.where(user_id: @current_user.id)
    team_id = params[:id]
    @team = Team.find(team_id)
    @players = PlayerPassport.where(team_id: team_id).includes(:player)
  end
end
