class LeaguesController < ApplicationController
  include PlayerPassportHelper
  include TeamsHelper
  include LeaguesHelper

  def index
    @current_user = current_user
    @leagues = League.where(user_id: @current_user.id)
    @leagues.each do |league_info|
      break if Team.where(league_id: league_info["id"]).exists?
      create_teams(league_info.attributes)
    end
     @team_id = Team.where(ownership: true).pluck(:id)
  end

  def new
    create_leagues
    leagues = League.where(user_id: @current_user.id)
    league_ids = leagues.pluck('id')
    leagues.each do |league_info|
      create_teams(league_info.attributes)
    end
    create_passport_entry(league_ids)
    redirect_to user_leagues_path(current_user)
  end

  def create
    league_ids = League.where(user_id: current_user.id).pluck('id')
    create_passport_entry(league_ids)
    redirect_to user_leagues_path(current_user)
  end

  def show
    @league_id = params[:id]
    @leagues = League.where(user_id: current_user.id)
    @teams = Team.where(league_id: @league_id)
    @player_passports = PlayerPassport.where(league_id: @league_id)
    @jock_buff_ranks = JBR.new.jock_ranks(@league_id)
    @category = "jbr"
  end

  def team_ranks
    @current_user = current_user
    @league_id = params[:league_id]
    @teams = Team.where(league_id: @league_id)
    @player_passports = PlayerPassport.where(league_id: @league_id)
    @jock_buff_ranks = JBR.new.jock_ranks(@league_id)
    @category = params[:category]
    render partial: 'team_ranks', locals: {category: @category}
  end

end
