module LeaguesHelper

  def current_user_leagues(user_id)
    League.where(user_id: user_id)
  end






  def find_average

  end

  def find_ranking

  end





end
