require 'byebug'
module TeamsHelper
  def create_teams (league_info)
    league_key = league_info[:league_key]
    @owner_info_arr = league_call(league_key)
    @owner_info_arr.map do |owner|
      owner_info = {}
      user_team = League.where(league_info).pluck(:user_team)[0]
      league_id = League.where(league_info).pluck(:id)[0]
      owner_info.merge!(league_id: league_id)
      owner_info.merge!(name: owner["fantasy_content"]["team"]["name"])
      if user_team == owner["fantasy_content"]["team"]["name"]
        ownership = true
      else
        ownership = false
      end
      owner_info.merge!(ownership: ownership)
      Team.create(owner_info).valid?
      end
  end
end