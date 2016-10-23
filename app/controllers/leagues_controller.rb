require "httparty"

class LeaguesController < ApplicationController

  def new
    @league = League.new
  end

  def create (team_info)
    puts '\n\n\n we Made it Here \n\n\n'
    @league = League.new(team_info)

  end

  private
    # def league_params(token)
    #   user_info = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=363/teams", headers:{
    #     "Authorization" => "Bearer #{token}"

  end

# test = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=363/teams", headers:{
#   "Authorization" => "Bearer pWbPVW2bvwhVfhquokg_GsHxlwxUzOvRz731TzmfEOtcHfFY5PMWkZEP5X9Cd04ZNbgewwRPkDHiQaxv_QpTfUyrFmgmVAvXyoiTy6CzKXw8PobCs6sZ1odBFCNlNsmphfjKY5uj_Jui7Q7s_h2b00fM6d4ZD2Lm_a1sfMH80ZsIKoGH7T7cG6BwA1Ghwc.nMpuCzlR.RxKpMcc2Mra_WFvjb5DQhFv2YFOaFrJA.irORAjmTCZ0qFWjR3Zi6YZFQr_WAyV4VxV.hXpwYlfL0zyTe47e9ZZ9seGbBtg1yV_H2qgmPaELgcz7LxIy79E250vH6pEaH6lHSHGbegk.HzruWubW0ggKgVSK0tewgeZNSfG66UT94MNlFXCShjuMIiz7dUjGzPV65rAeGKxmLFzjk3orGvJ1lZ0zX3CTPKCkVWXZBPGx04dnpfzaTG9je3O3H_O61.UHS7gEyLiEdE2qf.RRm75gZhKx0z_xaj5uqU1F7qO92GN9foI9y9ahrPycH4I3DBBuzyeH.OAsQ9WMgE3xCYcE1w8sNitPyeAjXfl0jbWdndUY6.nsumMKDRhE.gEe0dgZm23HosMdgtnrta2b51PQdOBJv0RqhG4FW.kdn2zXwHsMBLIjDLxh.fo6XNbsbkI4435a8IB5n7TZZkCaMWX7dLMfJBRIKad3fT9ARmCmKflfIIvY9S0bDWrESP4TAJXqn99.GPVdyEC67_lTs1BbIwzPCK5i52yFv8rHfm2iamEBzfO6HkGHmglUV_snHK7j"
# })
# p test

