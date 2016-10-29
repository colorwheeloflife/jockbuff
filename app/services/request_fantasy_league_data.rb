class RequestFantasyLeagueData
  YAHOO_URL = "https://fantasysports.yahooapis.com/fantasy/v2/"
  attr_accessor :league_key, :token
  attr_writer :client

  def self.call(league_key, token)
    instance = new(league_key, token)
    instance.()
  end

  def initialize(league_key, token)
    @league_key = league_key
    @token = token
  end

  def client
    @client ||= HTTParty
  end

  def call
    team_rosters
  end

  private

  def number_of_teams
    @number_of_teams ||= league["fantasy_content"]["league"]["num_teams"].to_i
  end

  def team_rosters
    @team_rosters ||= 1.upto(number_of_teams).map do |team|
      @client.get("#{@yahoo_root}team/#{league_key}.t.#{team}/roster/players",
        headers:{
          "Authorization" => "Bearer #{@current_user.token}"
        })
    end
  end

  def league
    @league ||= @client.get(YAHOO_URL + "league/#{league_key}/settings",
      headers:{
        "Authorization" => "Bearer #{@current_user.token}"
      })
  end
end