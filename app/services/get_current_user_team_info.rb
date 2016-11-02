class GetCurrentUserTeamInfo

  attr_accessor :league_id, :team_id, :player, :user_id

  def get_roster(league_id)
    @players = PlayerPassport.where(league_id: true)
    team = Team.where(league_id: league_id, ownership: true).pluck(:id)
    @user_players = PlayerPassport.where(team_id: team).includes(:player)
  end

  def get_team_name(league_id)
    @team_name = Team.where(league_id: league_id, ownership: true).pluck(:name).join("")
  end

end