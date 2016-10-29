class ComparesController < ApplicationController
  include TeamsHelper
  include ApplicationHelper

  def index
    league_id = params[:league_id]
    @players = PlayerPassport.where(league_id: true)
    @team_name = Team.where(league_id: league_id, ownership: true).pluck(:name).join("")
    team = Team.where(league_id: league_id, ownership: true).pluck(:id)
    @current_user_players = PlayerPassport.where(team_id: team).includes(:player)
    # @players = PlayerPassport.where(team_id: team_id).includes(:player)
  end

end
