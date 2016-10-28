class PlayerPassportController < ApplicationController

  def create
    render json: BuildPlayerRoster.(params[:league_id], current_user.token)
  end

end

