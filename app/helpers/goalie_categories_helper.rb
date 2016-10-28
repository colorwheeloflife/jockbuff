module GoalieCategoriesHelper

def create_goalie_categories(league_settings, league_info)
stat_cats = league_settings["fantasy_content"]["league"]["settings"]["stat_categories"]["stats"]["stat"]

    goalie_cats = stat_cats.select {|cat| cat["stat_position_types"]["stat_position_type"]["position_type"] == "G"}

    goalie_cats = goalie_cats.map do |cat|
       cat["name"]
    end

    league_id = League.where(:league_key => league_info[:league_key]).where(:user_id => @current_user.id).pluck(:id)
    league_id = league_id[0]


    goalie_cats_save = {
      league_id: league_id,
      gs: goalie_cats.include?('Games Started'),
      w: goalie_cats.include?('Wins'),
      l: goalie_cats.include?('Losses'),
      ga: goalie_cats.include?('Goals Against'),
      gaa: goalie_cats.include?('Goals Against Average'),
      sa: goalie_cats.include?('Shots Against'),
      sec: goalie_cats.include?('Seconds Played'),
      sv: goalie_cats.include?('Saves'),
      svpercent: goalie_cats.include?('Save Percentage'),
      sho: goalie_cats.include?('Shutouts'),
      total: goalie_cats.include?('Total Standard Deviation')
    }

    GoalieCategory.create(goalie_cats_save)
  end


end
