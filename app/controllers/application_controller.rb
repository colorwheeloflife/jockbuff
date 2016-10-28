class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :yahoo_root
  helper_method :league_call


  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

  def yahoo_root
    return @yahoo_root = "https://fantasysports.yahooapis.com/fantasy/v2/"
    # "https://fantasysports.yahooapis.com/fantasy/v2/"
  end

  def league_call(league_key)
    @current_user = current_user
    @yahoo_root = yahoo_root
    league_full = HTTParty.get("#{@yahoo_root}league/#{league_key}/settings", headers:{
      "Authorization" => "Bearer #{@current_user.token}"
    })
    num_teams = league_full["fantasy_content"]["league"]["num_teams"].to_i
    team_arr = (1..num_teams).to_a
    team_info_arr = team_arr.map do |team|
      team_info = HTTParty.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players", headers:{
      "Authorization" => "Bearer #{@current_user.token}"
      })
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
end
