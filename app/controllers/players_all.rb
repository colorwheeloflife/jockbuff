require 'httparty'
require 'byebug'

    full_player_arr = []
    i = 0
    while i < 1888 do
      full_player_arr.push(i)
      i = i + 25
    end
    players_full = full_player_arr.map do |start|
      players = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91004/players;start=#{start}", headers:{
"Authorization" => "Bearer K8Ttpcubvwh1M_Fz2bdgUYQ.tjtC_BNg.0Na0w2ksAgpOQEVWZVsWqkuTUz7Dwb__uUMRyQRLPjR.oTmwP3GtqF5_RHPOGbffAgha2lYLu3yGlUyaEYchxi76_cUjcGw_zx3CC96y7jPJWTtLJ4M27IxnIYHM8yb5_JXKpZPZONtA4jY3qgLCQ4U.9zyNK7_7crwWCNz.YZ02h.4PIeTUutMxsQWsYQ_yRf1NkGhfluFzR_j.kneW9TuAy_NgK07TLGDgP1moEyhqExCtot4gJ4GR7UcB3hE0hL_lpNOytktWZXKKSIQxwtdalcjX_ip38zWUTS1yxMidwPkgvZr4KZPNkI6t2O5.Q_W6bkLwzikei6kFr9BvHEZu8003MWXrTVrIx4gnVgKEq3XxVdh989OKKM6jCwKthATR9xOHPuZdSv3MQMG2jBe3iauqymTb5piwBLpa7eJQ57APYdXJ8Cklz8yX2HVPqrnOdpqOIDwDh7U.4jObUY.H0npls1hV4mtgWyoLxMUNW.EylorrX_klIJTIHhJlRAzni58GLfaIGy8fRoeYvEHfIK488KqgGPnxBeAcDeU61bkyBPqPlmQR21wYVByx5vxK3CwIFiw6BcYS4dPA5sdHulWrQP_9GXnGOQUGxlleROuf6mPP3caVarRscYRO4txsOJV0vjGLdamVJJH_NmK848uY1rAYvcw8BhnfSLHTucliUvLUP.urf5yDca_KYtCHjdmxMBWbJAPr4KyTeSukGalVf_j4WNM3tDS4ZWG"})
      # byebug
      player_arr = players["fantasy_content"]["league"]["players"]["player"]
      player_arr.map do |player|
        player_details = {
          id: player["player_id"],
          name: player["name"]["full"],
          pro_team: player["editorial_team_abbr"],
          eligible_positions: player["eligible_positions"]["position"],
          type: player["position_type"]
        }
        p player_details
      end
    end