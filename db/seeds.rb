# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
require 'csv'

# csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'teamstats_2015.csv'))
# csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
# team_stat = csv2.map do |row|
#   row.to_hash
# end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'predictions.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# full_stat = csv.map do |row|
#   row = row.to_hash
#   player_id = Player.where(name: row['Player']).pluck(:player_id).first
#   row['player_id'] = player_id
#   row
# end

# goalie_stat = full_stat.select { |row| row['Position'] == "G" }

# player_stat = (full_stat - goalie_stat)

# goalie_stat.each do |row|
#   t = GoaliePrediction.new
#   t.player_id = row['player_id'].to_i
#   t.gs = row['Games Played'].to_i
#   t.w = row['W'].to_i
#   t.l = (row['Games Played'].to_i - row['W'].to_i)
#   t.ga = (row['Games Played'].to_i * row['GAA'].to_i).round
#   t.gaa = row['GAA'].to_f
#   goalie_team = team_stat.select{ |team| team['Team'] == row['Team']}
#   team_shots = goalie_team[0]['SA/GP'].to_f
#   t.sa = (row['Games Played'].to_i *  team_shots).round
#   t.sv = ((row['Games Played'].to_i *  team_shots) - (row['Games Played'].to_i * row['GAA'].to_i)).round
#   t.svpercent = row['SV%'].to_f
#   t.sho = row['SO'].to_i
#   t.save
# end

# player_stat.each do |row|

#   goalpercentage = (row['G'].to_f / row['P'].to_f) if row['P'].to_i > 0
#   goalpercentage = 0 if row['P'].to_i == 0
#   shpercent = (row['G'].to_f / row['SOG'].to_f) if row['SOG'].to_i > 0
#   shpercent = 0 if row['SOG'].to_i == 0
#   t = PlayerPrediction.new
#   t.player_id = row['player_id'].to_i
#   t.g = row['G'].to_i
#   t.p = row['P'].to_i
#   t.a = row['A'].to_i
#   t.plusminus = row['+/-'].to_i
#   t.pim = row['PIM'].to_i
#   t.ppg = (row['PPP'].to_i * goalpercentage).round
#   t.ppa = (row['PPP'].to_i * (1 - goalpercentage)).round
#   t.ppp = row['PPP'].to_i
#   t.shg = row['SHG'].to_i
#   t.sha = (row['SHP'].to_i - row['SHG'].to_i)
#   t.shp = row['SHP'].to_i
#   t.gwg = row['GWG'].to_i
#   t.gtg = row['GWG'].to_i
#   t.sog = row['SOG'].to_i
#   t.shpercent = shpercent
#   t.fw = row['FOW'].to_i
#   t.fl = row['FOW'].to_i
#   t.hit = row['HITS'].to_i
#   t.blk = row['BKS'].to_i
#   t.save
# end

  def players_to_seed
    full_player_arr = []
    i = 0
    while i < 1888 do
      full_player_arr.push(i)
      i = i + 25
    end
    players_full = full_player_arr.map do |start|
      players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91004/players;start=#{start}", headers:{
          "Authorization" => "Bearer fFGaKrGbvwg_7koG4Bmf6_3O.JVwt7C7Z5amEpT_WitFCXkvV9xDS0z1EptNJSBLpNWRqmglUK1Mo.dcB_W5gsFUoUaRx1ME_U7xOE75zv9Fbzb_7kReFg_3RMqWMexcSUZs7JI5gFFgy8o2pTzrw17r7i3uUyxPY46MULBaW1Y1.xbCyNLNBGetdBfnP5PPW6AYOCl3Z1JzmMAdYr3slz21K_YDDCR8lIH3ZrgdA4alPAcVsEA1aJRT4jce_AODcr21bzAK9IDay5.LgMkhx.UspXJSzQmE_eDsZlNB8FwSTNHL9bLVNOuYKQBbAYC9Own7Hd4PQG7ZIyxbjicr_aro6vOv5Vd4reEii6RBKav5RU1JHgfN0WZSZjr4Dp9WSOsvX4QtaZ3MHs6d7sJaO.owdWeuU0KHzsxqCtJTEHvGoVUw57DKcemy.yyzjGxHgO930PvrUtUTEaTHrVR4p8SG5gk4t5mx1U0RPboRBflS8ylWF1kW99Qmo8fXPoyxwANZvAw_zu_3vLa_T3Bia_KGFZgxir3LY2CCmUYc5nDgKnD.BnnOEv02K6MrWWwmL5LQSG0quT9AEl0SwKQuObeehPkADUH2LCMXlTCGEK11Vn0nHW4eNN1gwtS4PLGWdYrtk18EXl0yTAB9amnqi2YMW5afeHRcO2CwC6V9l3gYLdL6b4tZ8ORmVWTO7WPeRkL0SSzGNvtrdUIRQu9qvt.B21M2w0.jgAk2bL1KIk7PP_ixxdNVmHZQq8Vr51RyeDPLVB3GmDfi"
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
    player_details = players_to_seed
    Player.create(player_details)
