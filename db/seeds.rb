# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'teamstats_2015.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
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

goalie_stat = full_stat_hash.select { |row| row['Position'] == "G" }

player_stat = full_stat_hash - goalie_stat

goalie_stat.each do |row|
  t = GoaliePrediction.new
  t.player_id = row['player_id']
  t.gs = row['Games Played']
  t.w = row['W']
  t.l = row['Games Played'] - row['W']
  t.ga = (row['Games Played'] * row['GAA']).round
  t.gaa = row['GAA']
  goalie_team = team_stat.select{ |team| team['Team'] == row['Team']}
  team_shots = goalie_team['SA/GP']
  t.sa = (row['Games Played'] *  team_shots).round
  t.sv = ((row['Games Played'] *  team_shots) - (row['Games Played'] * row['GAA'])).round
  t.svpercent = row['SV%']
  t.sho = row['SO']
end

player_stat.each do |row|
  t = PlayerPrediction.new
  t.player_id = row['player_id']
  t.g = row['G']
  t.p = row['P']
  t.a = row['A']
  t.plusminus = row['+/-']
  t.pim = row['PIM']
  goalpercentage = t.['G'] / t.['P']
  t.ppg = (row['PPP'] * goalpercentage).round
  t.ppa = (row['PPP'] * (1 - goalpercentage)).round
  t.ppp = row['PPP']
  t.shg = row['SHG']
  t.sha = row[]
  t.shp = row['SHP']
  t.gwg = row['GWG']
  t.gtg = row['GWG']
  t.sog = row[]
  t.shpercent = row['G'] / row['SOG']
  t.fw = row['FOW']
  t.fl = row[]
  t.hit = row['HITS']
  t.blk = row['BKS']
end