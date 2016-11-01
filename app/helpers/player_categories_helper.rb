module PlayerCategoriesHelper
  
  def create_player_categories(league_settings, league_info)

    league_id = League.where(:league_key => league_info[:league_key]).where(:user_id => @current_user.id).pluck(:id)
    league_id = league_id[0]

    stat_cats = league_settings["fantasy_content"]["league"]["settings"]["stat_categories"]["stats"]["stat"]
      player_cats = stat_cats.select {|cat| cat["stat_position_types"]["stat_position_type"]["position_type"] == "P"}
    player_cats = player_cats.map do |cat|
       cat["name"]
    end

    player_cats_save = {
      league_id: league_id,
      g: player_cats.include?('Goals'),
      a: player_cats.include?('Assists'),
      p: player_cats.include?('Points'),
      plusminus: player_cats.include?('Plus/Minus'),
      pim: player_cats.include?('Penalty Minutes'),
      ppg: player_cats.include?('Powerplay Goals'),
      ppa: player_cats.include?('Powerplay Assists'),
      ppp: player_cats.include?('Powerplay Points'),
      shg: player_cats.include?('Shorthanded Goals'),
      sha: player_cats.include?('Shorthanded Assists'),
      shp: player_cats.include?('Shorthanded Points'),
      gwg: player_cats.include?('Game-Winning Goals'),
      gtg: player_cats.include?('Game-Tying Goals'),
      sog: player_cats.include?('Shots on Goal'),
      shpercent: player_cats.include?('Shooting Percentage'),
      fw: player_cats.include?('Faceoffs Won'),
      fl: player_cats.include?('Faceoffs Lost'),
      hit: player_cats.include?('Hits'),
      blk: player_cats.include?('Blocks'),
    }
    @player_category = PlayerCategory.create(player_cats_save)
    end
end
