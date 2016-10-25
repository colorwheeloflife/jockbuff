class GoalieCategoriesController < ApplicationController

  def create(league_key)
    @current_user = current_user
    league_full = HTTParty.get("#{@yahoo_root}league/#{league_key}/settings", headers:{
      "Authorization" => "Bearer #{@current_user.token}"
    })
    stat_cats = league_full["fantasy_content"]["league"]["settings"]["stat_categories"]["stats"]["stat"]

    goalie_cats = stat_cats.select {|cat| cat["stat_position_types"]["stat_position_type"]["position_type"] == "G"}
    goalie_cats = goalie_cats.map do |cat|
       cat["name"]
    end
    goalie_cats_save = {
      league_id: league_id,
      gs: goalie_cats.include? 'Games Started',
      w: goalie_cats.include? 'Wins',
      l: goalie_cats.include? 'Losses',
      ga: goalie_cats.include? 'Goals Against',
      gaa: goalie_cats.include? 'Goals Against Average',
      sa: goalie_cats.include? 'Shots Against',
      sec: goalie_cats.include? 'Seconds Played',
      sv: goalie_cats.include? 'Saves',
      svpercet: goalie_cats.include? 'Save Percentage',
      sho: goalie_cats.include? 'Shutouts',
      total: goalie_cats.include? 'Total Standard Deviation'
    }
    @goalie_categories = GoalieCategory.create(goalie_cats_save})
  end

end
