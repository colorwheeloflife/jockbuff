class SessionsController < ApplicationController

  def new
    redirect_to '/auth/yahoo'
  end

  def create
    auth = request.env["omniauth.auth"]
    puts "\n\n\n\nAUTH: #{auth}\n\n\n"
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # reset_session
    session[:user_id] = user.id
    redirect_to leagues_path, :notice => 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end