require 'csv'

def players_to_seed
  token = User.first.token
  full_player_arr = []
  i = 0
  while i < 1888 do
    full_player_arr.push(i)
    i = i + 25
  end
  players_full = full_player_arr.map do |start|
    sleep(0.2)
    p start
    players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.473/players;start=#{start}", headers:{
        "Authorization" => "Bearer #{token}"
      })
    player_arr = players["fantasy_content"]["league"]["players"]["player"]
    player_arr.map do |player|
      positions = player["eligible_positions"]["position"]
      positions = positions.gsub(/[\[\]'"\/]+/, '').split(",") if positions.include?(" ")
      positions = positions = positions.split(" ") unless positions.include?(" ")
      player_details = {
        player_id: player["player_id"],
        name: player["name"]["full"],
        pro_team: player["editorial_team_abbr"],
        positions: positions,
        type_p: player["position_type"]
      }
    end
  end
end

def player_predictions

  teamstats = File.read(Rails.root.join('lib', 'seeds', 'teamstats_2015.csv'))
  teamstats_parse = CSV.parse(teamstats, :headers => true, :encoding => 'ISO-8859-1')
  team_stat = teamstats_parse.map do |row|
    row.to_hash
  end

  predictions = File.read(Rails.root.join('lib', 'seeds', 'predictions.csv'))
  predictions_parsed = CSV.parse(predictions, :headers => true, :encoding => 'ISO-8859-1')
  full_stat = predictions_parsed.map do |row|
    row = row.to_hash
    player_id = Player.where(name: row['Player']).pluck(:player_id).first
    puts row['Player'] if player_id == nil
    row['player_id'] = player_id
    row
  end

  goalie_stat = full_stat.select { |row| row['Position'] == "G" }
  player_stat = (full_stat - goalie_stat)

  player_stat.each do |row|

  end

  goalie_stat.each do |row|
    t = PlayerPrediction.new
    t.player_id = row['player_id'].to_i
    t.gp = row['Games Played'].to_i
    t.gs = row['Games Played'].to_i
    t.w = row['W'].to_i
    t.l = (row['Games Played'].to_i - row['W'].to_i)
    t.ga = (row['Games Played'].to_i * row['GAA'].to_i).round
    t.gaa = row['GAA'].to_f
    goalie_team = team_stat.select{ |team| team['Team'] == row['Team']}
    team_shots = goalie_team[0]['SA/GP'].to_f
    t.sa = (row['Games Played'].to_i *  team_shots).round
    t.sv = ((row['Games Played'].to_i *  team_shots) - (row['Games Played'].to_i * row['GAA'].to_i)).round
    t.svpercent = row['SV%'].to_f
    t.sho = row['SO'].to_i
    t.save
  end

  player_stat.each do |row|
    goalpercentage = (row['G'].to_f / row['P'].to_f) if row['P'].to_i > 0
    goalpercentage = 0 if row['P'].to_i == 0
    shpercent = (row['G'].to_f / row['SOG'].to_f) if row['SOG'].to_i > 0
    shpercent = 0 if row['SOG'].to_i == 0
    t = PlayerPrediction.new
    t.player_id = row['player_id'].to_i
    t.gp = row['Games Played'].to_i
    t.g = row['G'].to_i
    t.p = row['P'].to_i
    t.a = row['A'].to_i
    t.plusminus = row['+/-'].to_i
    t.pim = row['PIM'].to_i
    t.ppg = (row['PPP'].to_i * goalpercentage).round
    t.ppa = (row['PPP'].to_i * (1 - goalpercentage)).round
    t.ppp = row['PPP'].to_i
    t.shg = row['SHG'].to_i
    t.sha = (row['SHP'].to_i - row['SHG'].to_i)
    t.shp = row['SHP'].to_i
    t.gwg = row['GWG'].to_i
    t.gtg = row['GWG'].to_i
    t.sog = row['SOG'].to_i
    t.shpercent = shpercent
    t.fw = row['FOW'].to_i
    t.fl = row['FOW'].to_i
    t.hit = row['HITS'].to_i
    t.blk = row['BKS'].to_i
    t.save
  end
end

def player_stats_current
  token = User.first.token
  player_ids = Player.all.pluck(:player_id)
  # index = player_ids.index(3982)
  # player_ids = player_ids.slice(index, player_ids.length)
  player_ids.each do |player_id|
    player = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/player/363.p.#{player_id}/stats", headers:{
          "Authorization" => "Bearer #{token}"
        })
    player_stats = {player_id: player_id}
    player_full_stats = player["fantasy_content"]["player"]["player_stats"]["stats"]["stat"]
    player_full_stats.select do |stat|
      # byebug
      player_stats.merge!({ gp: stat['value'] }) if stat['stat_id'] == "30"
      ## gp for players is a different code than goalie
      player_stats.merge!({ gp: stat['value'] }) if stat['stat_id'] == "29"
      player_stats.merge!({ g: stat['value'] }) if stat['stat_id'] == "1"
      player_stats.merge!({ a: stat['value'] }) if stat['stat_id'] == "2"
      player_stats.merge!({ p: stat['value'] })if stat['stat_id'] == "3"
      player_stats.merge!({ plusminus:  stat['value'] }) if stat['stat_id'] == "4"
      player_stats.merge!({ pim: stat['value'] }) if stat['stat_id'] == "5"
      player_stats.merge!({ ppg: stat['value'] }) if stat['stat_id'] == "6"
      player_stats.merge!({ ppa: stat['value'] }) if stat['stat_id'] == "7"
      player_stats.merge!({ ppp: stat['value'] }) if stat['stat_id'] == "8"
      player_stats.merge!({ shg: stat['value'] }) if stat['stat_id'] == "9"
      player_stats.merge!({ sha: stat['value'] }) if stat['stat_id'] == "10"
      player_stats.merge!({ shp: stat['value'] }) if stat['stat_id'] == "11"
      player_stats.merge!({ gwg: stat['value'] }) if stat['stat_id'] == "12"
      player_stats.merge!({ gwg: stat['value'] }) if stat['stat_id'] == "13"
      player_stats.merge!({ sog: stat['value'] }) if stat['stat_id'] == "14"
      player_stats.merge!({ shpercent: stat['value'] }) if stat['stat_id'] == "15"
      player_stats.merge!({ fw: stat['value'] }) if stat['stat_id'] == "16"
      player_stats.merge!({ fl: stat['value'] }) if stat['stat_id'] == "17"
      player_stats.merge!({ hit: stat['value'] }) if stat['stat_id'] == "31"
      player_stats.merge!({ blk: stat['value'] }) if stat['stat_id'] == "32"
      player_stats.merge!({ gs: stat['value'] }) if stat['stat_id'] == "18"
      player_stats.merge!({ w: stat['value'] }) if stat['stat_id'] == "19"
      player_stats.merge!({ l: stat['value'] }) if stat['stat_id'] == "20"
      player_stats.merge!({ ga: stat['value'] }) if stat['stat_id'] == "22"
      player_stats.merge!({ gaa: stat['value'] }) if stat['stat_id'] == "23"
      player_stats.merge!({ sa: stat['value'] }) if stat['stat_id'] == "24"
      player_stats.merge!({ sec: (stat['value'].to_i * 60) }) if stat['stat_id'] == "28"
      player_stats.merge!({ sv: stat['value'] }) if stat['stat_id'] == "25"
      player_stats.merge!({ svpercent: stat['value'] }) if stat['stat_id'] == "26"
      player_stats.merge!({ sho: stat['value'] }) if stat['stat_id'] == "27"
    end
  sleep(1)
  PlayerStat.create(player_stats)
  end
end


# ####
Player.create(players_to_seed)
player_predictions
all_predictions = PlayerPrediction.all.pluck(:player_id)
Player.where.not(player_id: all_predictions).destroy_all
player_stats_current
# ####
