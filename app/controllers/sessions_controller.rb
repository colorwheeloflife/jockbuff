class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end


# class SessionsController < ApplicationController

#   def new
#     redirect_to '/auth/twitter'
#   end

#   def create
#     auth = request.env["omniauth.auth"]
#     user = User.where(:provider => auth['provider'],
#                       :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
#     reset_session
#     session[:user_id] = user.id
#     redirect_to root_url, :notice => 'Signed in!'
#   end

#   def destroy
#     reset_session
#     redirect_to root_url, :notice => 'Signed out!'
#   end

#   def failure
#     redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
#   end

# end
