module LeaguesHelper

  def current_user_leagues(user_id)
    League.where(user_id: user_id)
  end

end
