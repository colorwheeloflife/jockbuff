class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  require 'table-for'
  include PlayerPassportHelper
  include TeamsHelper

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :yahoo_root
  helper_method :league_call
  helper_method :jbr_by_cat
  helper_method :jbr_by_team

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def yahoo_root
    return @yahoo_root = "https://fantasysports.yahooapis.com/fantasy/v2/"
  end

 def league_call(league_key)
    @current_user = current_user
    @yahoo_root = yahoo_root
    league_full = HTTParty.get("#{@yahoo_root}league/#{league_key}/settings", headers:{
      "Authorization" => "Bearer #{current_user.token}"
    })
    num_teams = league_full["fantasy_content"]["league"]["num_teams"].to_i
    team_arr = (1..num_teams).to_a
    team_info_arr = team_arr.map do |team|
      team_info = HTTParty.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players", headers:{
      "Authorization" => "Bearer #{current_user.token}"
      })
      if team_info["fantasy_content"]
        team_info
      else
      sleep(5)
      team_info = HTTParty.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players", headers:{
      "Authorization" => "Bearer #{current_user.token}"
      })
    end
    team_info
    end
    return team_info_arr
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    end
  end

  def create
    @create_league = create_leagues
    league_ids = League.where(user_id: @current_user.id).pluck('id')
    @player_passport = create_passport_entry(league_ids)
  end

  def jbr_by_cat(player_bool, player_ids, category)
    player_ids = [player_ids] unless player_ids.is_a? Array
    rank_by_cat = []
    jbr_cat_arr = player_ids.each do |player_id|
      jbr_cat = @jock_buff_ranks[player_bool].select do |stat|
        jbr_cat = stat[category] if stat[:player_id] == player_id.to_i
    end
    rank_by_cat.push([player_id.to_i, jbr_cat[0][category]])
    end
    rank_by_cat.to_h.sort_by {|k,v| v}.reverse.to_h
  end

  def jbr_by_team (team_id, category)
    team_players = PlayerPassport.where(team_id: team_id).pluck("player_id")
    goalies = team_players.select do |pl|
      pl if Player.find_by(player_id: pl, type_p: "G")
      end
    skaters = team_players - goalies
    all_skater_jbr = jbr_by_cat(1, skaters, category)
    all_goalie_jbr = jbr_by_cat(0, goalies, category)
    grading_scale = team_players.length.to_f/11
    team_jbr = (all_skater_jbr.merge(all_goalie_jbr).values.inject{ |a, b| a + b }/grading_scale).to_i
  end

end
