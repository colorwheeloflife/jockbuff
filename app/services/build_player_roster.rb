class BuildPlayerRoster
  attr_accessor :league_id, :token

  def self.call(league_id, token)
    instance = new(league_id, token)
    instance.()
  end

  def initialize(league_id, token)
    @league_id = league_id
    @token = token
  end

  def call
    fantasy_league_data.map do |team|
      player_info = team["roster"]["players"]["player"]
      team_key = team["team_key"]

      player_info.each do |roster|
        PlayerPassport.first_or_create({
          player_id: roster["player_id"],
          position: roster["selected_position"]["position"]
          team_key: team_key
        })
     end
    end
  end

  private

  def fantasy_league_data
    @fantasy_league_data ||= RequestFantasyLeagueData.(league_id, token)
  end
end