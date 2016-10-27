class TeamsController < ApplicationController

  def create
  end

  def show
    @current_user = current_user
    @leagues = League.where(user_id: @current_user.id)
    team_id = params[:id]
    # player_object = PlayerPassport.where(team_id: team_id).pluck(:player_id, :position)

    # @players = player_object.map do |player|
    #   players = {
    #   name: Player.where(player_id: player[0]).pluck(:name).first,
    #   pro_team: Player.where(player_id: player[0]).pluck(:pro_team).first,
    #   position: player[1]
    # }
    # end

    @players = PlayerPassport.where(team_id: team_id).includes(:player)

  end
end
