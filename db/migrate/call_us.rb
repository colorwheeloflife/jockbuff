
require 'httparty'
require 'byebug'

player_ids = Player.all.pluck(:player_id)

player_ids.each do |player_id|
  player = HTTParty.get("http://fantasysports.yahooapis.com/fantasy/v2/player/363.p.#{player_id}/stats", headers:{
        "Authorization" => "Bearer v0tJ5oKQo11Yxo55A0Zf25SOqaQT1oS54g3shsJQ2D9tGcewmhYzSmdRKpn0gxK8CEh9EPSf3X3aWD7XrNST.3JKKhJku5tT6EhNWIdwNBV_U1QxzSL8hTZppZowZkwN7_01OPDIssg.MK9gAqq0lBXUGK9ajPJvzHVwiByhgCYEZIE6CELxvyVcjawkA86d.z2Enmhly1KhgZm7T3w56fCixcQLlsETt2TtXkvFTrGTWy1S44CtuPaHF9MvJnD833Nrn2j_8WTvwkQG2j8shHJqL8exQqmPGouSf2ymJjpHYtcl5XRCFNzJhD2hor3AJMVr0Xu45nDODIW_N2QTCyZ6jiRFS3_0RiFpSAOJRI2.f3s2W7vktHv8LNtLGryNR2voQuM4z6WKchn5QTTk97RhtJKwshHH7P_j0nHvsc0lTxa_HHaWOQbdNBthABN8408s1uPpRQ.7Pbxd1uIVmlCoHHhRJIlNFI0bjOAWBxEMnj3R0s2.gy9tGJCO9LvrgZHgjrUw5pb8DfstXkqOpWsetRbMXdfVuoqepc5H3n1I7eiVhoe..RPNS3QRAI8atBk3Y6o6AnNi300mFfbVGZ9OOSmNnTxseOR3oiiHdZKckkvQKh9cSJZ_oIhto0564maNuo.H2XwbMDS5khtuqDD.PE086pftq8ofTNuUmsXZWX5FHirq0o8EKlZAMAni7R63MyYCC9r6h2Z9FKklSXVfAZEHSNSdZUvLaGg5KWXVyV1F0bEIeVx46iOstG5giX3.HGZgGA4wypX5iGBhNbdR5vBSmvOH9Ndbz91qRRDDtAElqW8Xx.xqjxexKqa1njdwDNVKe3gE1jISJ555y4cHvyQxKE6LzVvPiKehW7oikxqeiipe2eT5Ha4Z"
      })
  player = player["fantasy_content"]["league"]["players"]["player"]

end
  # player_stats = {
  #    player_id: player["player_id"],
  #       league_id: league_id,
  #       gs: goalie_cats.include?('Games Started'),
  #       w: goalie_cats.include?('Wins'),
  #       l: goalie_cats.include?('Losses'),
  #       ga: goalie_cats.include?('Goals Against'),
  #       gaa: goalie_cats.include?('Goals Against Average'),
  #       sa: goalie_cats.include?('Shots Against'),
  #       sec: goalie_cats.include?('Seconds Played'),
  #       sv: goalie_cats.include?('Saves'),
  #       svpercent: goalie_cats.include?('Save Percentage'),
  #       sho: goalie_cats.include?('Shutouts'),
  #       g: player_cats.include?('Goals'),
  #       a: player_cats.include?('Assists'),
  #       p: player_cats.include?('Points'),
  #       plusminus: player_cats.include?('Plus/Minus'),
  #       pim: player_cats.include?('Penalty Minutes'),
  #       ppg: player_cats.include?('Powerplay Goals'),
  #       ppa: player_cats.include?('Powerplay Assists'),
  #       ppp: player_cats.include?('Powerplay Points'),
  #       shg: player_cats.include?('Shorthanded Goals'),
  #       sha: player_cats.include?('Shorthanded Assists'),
  #       shp: player_cats.include?('Shorthanded Points'),
  #       gwg: player_cats.include?('Game-Winning Goals'),
  #       gtg: player_cats.include?('Game-Tying Goals'),
  #       sog: player_cats.include?('Shots on Goal'),
  #       shpercent: player_cats.include?('Shooting Percentage'),
  #       fw: player_cats.include?('Faceoffs Won'),
  #       fl: player_cats.include?('Faceoffs Lost'),
  #       hit: player_cats.include?('Hits'),
  #       blk: player_cats.include?('Blocks'),
  #     }



