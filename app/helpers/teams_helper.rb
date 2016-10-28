
module TeamsHelper
  def create_teams (league_info)
    league_key = league_info[:league_key]
    team_info_arr = league_call(league_key)
    user_team = League.where(league_info).pluck(:user_team)[0]
    league_id = League.where(league_info).pluck(:id)[0]
    team_info = team_info_arr.map do |owner|
      team_info = {}
      team_info.merge!(league_id: league_id)
      team_info.merge!(name: owner["fantasy_content"]["team"]["name"])
      ownership = true if user_team == owner["fantasy_content"]["team"]["name"]
      ownership = false unless  user_team == owner["fantasy_content"]["team"]["name"]
      team_info.merge!(ownership: ownership)
      team_info.merge!(image: owner["fantasy_content"]["team"]["team_logos"]["team_logo"]["url"] )
      team_info.merge!(nickname: owner["fantasy_content"]["team"]["managers"]["manager"]["nickname"])
      team_info.merge!(url: owner["fantasy_content"]["team"]["url"])
      team_info
    end
    waiver_team = {league_id: league_id, ownership: false, name: 'Waiver'}
    team_info.push(waiver_team)
    Team.create(team_info)
    return team_info_arr
  end

end