module PlayerPassportHelper

  def create_passport_entry (league_info)
    league_id = League.where(:league_key => league_info[:league_key]).where(:user_id => @current_user.id).pluck(:id)
    league_id = league_id[0]
    @league_call = league_call
    @team_info_arr = @league_call(league_id)
    @current_user = current_user
    @team_info_arr.map do |team|

    player_info = team["roster"]["players"]["player"]
    team_key = team["team_key"]
    entry = player_info.map do |t|
      entry = {
      player_id: t["player_id"],
      position: t["selected_position"]["position"]
      team_key: team_key
      }
      @player = PlayerPassport.create(entry)
    end
  end
end
