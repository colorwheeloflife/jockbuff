require 'byebug'

module PlayerPassportHelper

      p '\n\n\n\n PlayerPassport  \n\n\n'


  def create_passport_entry (team_info_arr, league_info)
     league_key = league_info[:league_key]
    # @league_call = league_call(league_key)
    # @team_info_arr = @league_call

    @current_user = current_user
    full_league_owned_players = team_info_arr.map do |team|
      player_info = team["fantasy_content"]["team"]["roster"]["players"]["player"]
      league_id = League.find_by(league_info).id
      team_id = Team.find_by(league_id: league_id, name: team['fantasy_content']['team']['name']).id
      player_info.map do |t|
        PlayerPassport.new(
        player_id: t["player_id"].to_i,
        position: t["selected_position"]["position"],
        team_id: team_id,
        league_id: league_id
        )
      end
    end

    byebug
    ActiveRecord::Base.transaction do
      PlayerPassport.import(full_league_owned_players.flatten)
    end

    league_id = League.where(league_info).pluck(:id)[0]
    owned_players = PlayerPassport.where(league_id: league_id).pluck('player_id')
    all_players = Player.all.pluck('player_id')
    available_players = all_players - owned_players
    create_waivers = available_players.map do |p|
      PlayerPassport.new(
        player_id: p,
        position: 'WW',
        team_id: Team.find_by(league_id: league_id, name: 'Waiver').id,
        league_id: league_id
      )
    end
    ActiveRecord::Base.transaction do
      PlayerPassport.import(create_waivers)
    end
  end
end
