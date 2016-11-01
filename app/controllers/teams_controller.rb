class TeamsController < ApplicationController

  include TeamsHelper
  include ApplicationHelper

  def create
  end

  def show
    @current_user = current_user
    leagues = League.where(user_id: @current_user.id)
    team_id = params[:id]
    @team = Team.find(team_id)
    @freeagents = PlayerPassport.where(position: "WW")
    @players = PlayerPassport.includes(:player).where(team_id: team_id)

  end

  # private

  # def sort_column
  #   Team.column_names.include?(params[:sort]) ? params[:sort] : "name"
  # end

  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end

end
