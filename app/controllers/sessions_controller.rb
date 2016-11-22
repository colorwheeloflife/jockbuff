class SessionsController < ApplicationController
  include LeaguesHelper

  def new
    redirect_to '/auth/yahoo'
  end

  def create
    auth = request.env["omniauth.auth"]
    puts auth
    user = User.where(:provider => auth['provider'],
                      :image => auth['info']['urls']['image'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    user.update(token: auth['credentials']['token'])
    session[:user_id] = user.id
    @current_user = current_user
    @create_league = create_leagues unless League.where(user_id: @current_user.id).exists?
    redirect_to user_leagues_path(current_user), :notice => 'Signed in!'
  end

  def demo
    user = User.find_by(id: 2)
    user.update(token: 'demo')
    session[:user_id] = user.id
    redirect_to user_leagues_path(current_user)
  end



  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

end