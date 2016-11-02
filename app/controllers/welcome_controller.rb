class WelcomeController < ApplicationController
  def welcome
     auth = request.env["omniauth.auth"]
    # puts "\n\n\n\nAUTH: #{auth}\n\n\n"
    @leagues = League.where(user_id: current_user.id)
    @team_id = Team.where(ownership: true).pluck(:id)
  end
end
