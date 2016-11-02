module ComparesHelper

  def find_total (category)
    total = 0
    @current_user_players.each do |cat|
    next if player_passport.player.positions.join(" / ").include?("G")
      total += cat
    end
    total
  end

  def find_difference (category)
    total = 0
  end

end
