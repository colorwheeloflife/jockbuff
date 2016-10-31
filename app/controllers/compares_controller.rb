class ComparesController < ApplicationController

  def index
    byebug
    @current_user_players = GetCurrentUserTeamInfo.new.get_roster(params[:league_id])
    @user_team_name = GetCurrentUserTeamInfo.new.get_team_name(params[:user_id], params[:league_id])
    @team_info = Team.where(league_id: params[:league_id], ownership: false).pluck(:name, :id)
    @jock_buff_ranks = JBR.new.jock_ranks(params[:league_id])
  end

  def render_trade_table
    @trade_team = TradingWithRoster.new.get_roster(params[:team_id])
    render :partial => 'render_trade_table'
  end

  def players_to_be_traded
    @players = PlayerPassport.where(team_id: team_id).includes(:player)
    render :partial => 'players_to_be_traded'
  end

end

