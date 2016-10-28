# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

  # def players_to_seed
  #   full_player_arr = []
  #   i = 0
  #   while i < 1888 do
  #     full_player_arr.push(i)
  #     i = i + 25
  #   end
  #   players_full = full_player_arr.map do |start|
  #     players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91004/players;start=#{start}", headers:{
  #         "Authorization" => "Bearer qHywlhWQo13.yJhhVJqXGuT2sV1e1dY86nSdP2z9arXm1DMRHDEsY7rVZMEDbjbSgCWJsZkM_41lYIoE7zEkhSmxYB3SvBuNRAitlVjuU8XQI0cqrJEdTUytBr0AgJysNOX7PwCGzXUe2fy5LZYewbrs_AbEW280_i2ldZIMBma0.RRqjfWLOBJSDvPNdd9dRQvTYLOxwf38AkuE_7Ib8oZrMkQgQI5pBiBRuZ1SGNKUVV7Nh76dMPSiKvHORbxjmYNVwSRsSyG5erPAe0Wo8L4QM1bCvDDzUaVuBYLgE13kSKTvnTfNlI.OPv_Y9B17mpucbZoo0YwKROMti64uaME2f8KC9D_30bw1ef8qcNtqyDw1.fXyA1DK70vuW8NNpmduzv0Ma3RdXWluaKfhrdLD3iGg6zX0dH1ey3coik6GdXj7p_q5P2_REmthG95BW7nd4Rcj7nn95EErFrIvsHGdJfv_bIV_yy1l36uwou6Ku5HBTfgJE8VmvZ7y.tNH6vkPizrrEpXD4LeO74YClP0WVhH0_q633YdEk4NTmiRhTroyE_NgDQfsi.rLJ.5zLLWOag270IFnfjVXAetX68iBQ7ph7Xm2PWhYLt_4CmTflAFF9wFlpp7ADYebmTHSBGJLX2hRFGVbcEwpcUhUsq.teGfUYEVqUeu746sq1vnnZfrZvf3Ujim7Be9gGnxPBNrVsoKtvjsieGRkbR1xhOPQLp67ERqDjSoyhm5JyxLIcLeyu20o7uoZ.W3ahPBeDI.sYnMPmroB3w4WD6FXIhYGE.4GQKCgXJWpGsuladbVE5xgXUFKzALiCD0JTc1LtazrkpQJGtAiohPtXxMJo.A0Vuk2dNMi_0R7VpLKZYKVd4Zil5_FxjGLnyCX"
  #       })
  #     player_arr = players["fantasy_content"]["league"]["players"]["player"]
  #    byebug
  #     player_arr.map do |player|
  #       positions = player["eligible_positions"]["position"]
  #       positions = positions.gsub(/[\[\]'"\/]+/, '').split(",") if positions.include?(" ")
  #       positions = positions = positions.split(" ") unless positions.include?(" ")
  #       player_details = {
  #         player_id: player["player_id"],
  #         name: player["name"]["full"],
  #         pro_team: player["editorial_team_abbr"],
  #         positions: positions,
  #         type_p: player["position_type"]
  #       }
  #     end
  #   end
  # end
  #   player_details = players_to_seed
  #   Player.create(player_details)




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

# schedules = File.read(Rails.root.join('lib', 'seeds', 'schedule.csv'))
# schedules_parsed = CSV.parse(schedules, :headers => true, :encoding => 'ISO-8859-1')
# full_sched = schedules_parsed.map do |row|
#   row = row.to_hash
# end

# full_sched.each do |row|
#   t = Schedule.new
#   t.team_name = row['name']
#   weeks = (1..24).to_a
#   weeks.each do |week|
#     wk = "week_#{week}"
#     t.wk = row[week]
#   end
# end


goalie_stat = full_stat.select { |row| row['Position'] == "G" }
player_stat = (full_stat - goalie_stat)

goalie_stat.each do |row|
  t = PlayerPrediction.new
  t.player_id = row['player_id'].to_i
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
  puts "\n\n\n\n\n #{t.valid?} \n\n\n"
  t.save
end

player_stat.each do |row|
  goalpercentage = (row['G'].to_f / row['P'].to_f) if row['P'].to_i > 0
  goalpercentage = 0 if row['P'].to_i == 0
  shpercent = (row['G'].to_f / row['SOG'].to_f) if row['SOG'].to_i > 0
  shpercent = 0 if row['SOG'].to_i == 0
  t = PlayerPrediction.new
  t.player_id = row['player_id'].to_i
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
  puts "\n\n\n\n\n #{t.errors.full_messages} \n\n\n"
  t.save
end


