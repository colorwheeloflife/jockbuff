require 'byebug'
module PlayerPassportHelper

  def create_passport_entry (league_info)
    league_key = league_info[:league_key]
    @league_call = league_call(league_key)
    @team_info_arr = @league_call
    @current_user = current_user
    @team_info_arr.map do |team|
      player_info = team["fantasy_content"]["team"]["roster"]["players"]["player"]
      league_id = League.where(league_info).pluck(:id)[0]
      team_id = Team.where(league_id: league_id, name: team['fantasy_content']['team']['name']).pluck(:id)[0]
      entry = player_info.map do |t|
        entry = {
        player_id: t["player_id"],
        position: t["selected_position"]["position"],
        team_id: team_id
        }

        PlayerPassport.create(entry)
      end
    end
  end
end
