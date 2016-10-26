require 'byebug'
module PlayerPassportHelper

  def create_passport_entry (league_id)
    @league_call = league_call(league_id)
    @team_info_arr = @league_call
    @current_user = current_user
    @team_info_arr.map do |team|
      player_info = team["fantasy_content"]["team"]["roster"]["players"]["player"]
      team_key = team["fantasy_content"]["team"]["team_key"]
      entry = player_info.map do |t|
        entry = {
        player_id: t["player_id"],
        position: t["selected_position"]["position"],
        team_id: team_key
        }
        byebug
        PlayerPassport.create(entry)
      end
    end
  end
end
