class TradingWithRoster

  attr_accessor :league_id, :team_id, :player, :user_id

  def get_roster(team_id)
    @user_players = PlayerPassport.where(team_id: team_id).includes(:player)
  end

  def get_team_name(league_id, user_id)
    @team_name = Team.where(league_id: league_id, ownership: false).pluck(:name).join("")
  end

end