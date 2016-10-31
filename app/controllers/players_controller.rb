class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction

include LeaguesHelper
include ApplicationHelper

  def index
    league_id = params[:league_id]
    @players = PlayerPassport.where(league_id: true)
    @team = Team.where(league_id: league_id, ownership: true).pluck(:id)
  end

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
        positions = player["eligible_positions"]["position"]
        positions = positions.gsub(/[\[\]'"\/]+/, '').split(",") if positions.include?(" ")
        positions = positions = positions.split(" ") unless positions.include?(" ")
        player_
        details = {
          player_id: player["player_id"],
          name: player["name"]["full"],
          pro_team: player["editorial_team_abbr"],
          positions: positions,
          type_p: player["position_type"]
        }
        @player = Player.create(player_details)

      end
    end
  end


  private

    def sort_column
      Player.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
