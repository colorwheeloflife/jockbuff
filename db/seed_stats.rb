# def seed_player_stats
#
#   player_ids = Players.all.pluck(:player_id)
#   player_ids.each do |player_id|
#   player = HTTParty.get("http://fantasysports.yahooapis.com/fantasy/v2/player/363.p.#{player_id}/stats", headers:{
#         "Authorization" => "Bearer #{User.first.token}"
#       })
#    player = ["fantasy_content"]["league"]["players"]["player"]
#       player_stats = {
#         player_id: player["player_id"],
#         league_id: league_id,
#         gs: goalie_cats.include?('Games Started'),
#         w: goalie_cats.include?('Wins'),
#         l: goalie_cats.include?('Losses'),
#         ga: goalie_cats.include?('Goals Against'),
#         gaa: goalie_cats.include?('Goals Against Average'),
#         sa: goalie_cats.include?('Shots Against'),
#         sec: goalie_cats.include?('Seconds Played'),
#         sv: goalie_cats.include?('Saves'),
#         svpercent: goalie_cats.include?('Save Percentage'),
#         sho: goalie_cats.include?('Shutouts'),
#         g: player_cats.include?('Goals'),
#         a: player_cats.include?('Assists'),
#         p: player_cats.include?('Points'),
#         plusminus: player_cats.include?('Plus/Minus'),
#         pim: player_cats.include?('Penalty Minutes'),
#         ppg: player_cats.include?('Powerplay Goals'),
#         ppa: player_cats.include?('Powerplay Assists'),
#         ppp: player_cats.include?('Powerplay Points'),
#         shg: player_cats.include?('Shorthanded Goals'),
#         sha: player_cats.include?('Shorthanded Assists'),
#         shp: player_cats.include?('Shorthanded Points'),
#         gwg: player_cats.include?('Game-Winning Goals'),
#         gtg: player_cats.include?('Game-Tying Goals'),
#         sog: player_cats.include?('Shots on Goal'),
#         shpercent: player_cats.include?('Shooting Percentage'),
#         fw: player_cats.include?('Faceoffs Won'),
#         fl: player_cats.include?('Faceoffs Lost'),
#         hit: player_cats.include?('Hits'),
#         blk: player_cats.include?('Blocks'),
#       }
#     end
#   end
# end
