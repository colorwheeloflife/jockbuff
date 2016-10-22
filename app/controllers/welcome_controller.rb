class WelcomeController < ApplicationController
  def welcome
     auth = request.env["omniauth.auth"]
    # puts "\n\n\n\nAUTH: #{auth}\n\n\n"
  end
end