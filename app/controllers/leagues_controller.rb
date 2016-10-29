require "httparty"

class LeaguesController < ApplicationController
  include PlayerPassportHelper
  include TeamsHelper

def index
  @current_user = current_user
  @leagues = League.where(user_id: @current_user.id)
  @leagues.each do |league_info|
    break if Team.where(league_id: league_info["id"]).exists?
    create_teams(league_info.attributes)
  end

end

  def create
    redirect_to user_leagues_path(current_user)
  end

  def show
    @league_id = params[:id]
    @player_passport = create_passport_entry(params[:id]) unless PlayerPassport.where(league_id: @league_id)
    @leagues = League.where(user_id: current_user.id)
    @teams = Team.where(league_id: @league_id)
  end

end