# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
require 'csv'


  def players_to_seed
    full_player_arr = []
    i = 0
    while i < 1888 do
      full_player_arr.push(i)
      i = i + 25
    end
    players_full = full_player_arr.map do |start|
      players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91004/players;start=#{start}", headers:{
          "Authorization" => "Bearer LqWKOxaQo12Av4R72Idg4WoYZ9R5Z7GI7z5VXBVtVbdiraoAQI_vVZWMTPaWBQgSWnbXRj0Y81CvvmuI.nrS8vu73.V7PymWH4kI5aL0X1d7KbMMi5AV9XNSUa5O1LpMMRRxxpfRHTRiBYKDc8NKUMqhJUBvphgfPSHUbWUDWxjSPG4h8dkqRxzX4iPUS8jt7zihSIFIfsT4T75U3ErO92vQNivd.BBvh5UIriWcT2Zo.L4TAN6Rp8_NKhwCxiZpWsffHVfauIWfwXt1VXQYh0XQ_vq_bYNHGdDoUlALzRgNQjOuIw6zn_FreoKYk5WraJxZrWTmDe5WmuhAdjH1GPg1g2zocN1385LNwVjnbXvJMmrmos.XkgAXSu_Jd4.6dYVX.EsLLkWmLSlfcjnVAeFSawqVvu64rXwKZBpvFidSMNwSWdDUMn56NKnaRm.MAYVk9kK6LHZDtxjw2L59TbJZZq8VVl7CHsftJ9JBXMBJiu5ijoNxLin.598ALE3qCAEnOm79J3DFLf45n9kxeXmw2XyPf0X4zIj1H99uzWpJia1gktMSKp2RwQLgs61VuvP26IlztRRaN5TOGBlWLGYyr45bTZ3Etp5N7yXD.z3h64eG4h8KFSfxBp2lZuqCQxzHmZWtpvuZaQy45wleZvgHGOkU9Ur8z0IrEILjyeW4LAxM3RjOeDicIUshnDBf14THuD8WxMh0UrVLyNy1mvWGkJMN.5_pKyjXxVtoRkzYT8gkwQNACD0m6dS_aQU71XVDoHCVw0_xC6x60sn79Np80h.sJNARRd6gY_s11IeapgsdwhsCjbBA4vYRUXKDThgS6sFCur2pR1yz7fmMZNzEzQTeFt4NEa0BqTBj2mVMu_uulCT6aqhZ3Xk-"
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


csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'teamstats_2015.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
team_stat = csv2.map do |row|
  row.to_hash
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'predictions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
full_stat = csv.map do |row|
  row = row.to_hash
  player_id = Player.where(name: row['Player']).pluck(:player_id).first
  row['player_id'] = player_id
  row
end

goalie_stat = full_stat.select { |row| row['Position'] == "G" }

player_stat = (full_stat - goalie_stat)

goalie_stat.each do |row|
  t = GoaliePrediction.new
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
  t.save
end
