require 'httparty'
require 'byebug'

  draft_full = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91006/draftresults", headers:{
        "Authorization" => "Bearer #{User.first.token}"
        })
  draft_players = draft_full["fantasy_content"]["league"]["draft_results"]["draft_result"]
  update_passport = draft_players.map do |player|
    draft_info = [player["pick"], player["player_key"].split('p.')[1]]
  end

      ActiveRecord::Base.transaction do
        PlayerPassport.import(full_league_owned_players.flatten)
      end
