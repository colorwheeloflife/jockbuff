class PlayersController < ApplicationController
include LeaguesHelper
include ApplicationHelper

  def index
    league_id = params[:league_id]
    @player_passports = PlayerPassport.includes(:player, :player_predictions).where(league_id: params[:league_id])
    @team = Team.where(league_id: league_id, ownership: true).pluck(:id)
  end

  def create

  end

  private

    def sort_column
      Player.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
