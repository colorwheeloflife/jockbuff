class WelcomeController < ApplicationController
  def welcome
     auth = request.env["omniauth.auth"]
  end
end