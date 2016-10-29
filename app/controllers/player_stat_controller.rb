class PlayerStatController < ApplicationController

#   def create
#     player_ids = Player.all.pluck(:player_id)
#     player_ids.each do |player_id|
#       player = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/player/363.p.#{player_id}/stats", headers:{
#             "Authorization" => "Bearer 0aUnqmKQo12IzJgIiToRtWdOqq5WsKZV9eRkkok0FU9kdDiSFEtNXjxuay6tosefVEcGmb08mkqHMXx3WqSl.g3pNo68KrolQUXsJZuhj363WP15mjXFFWyzm.lxu1sgRtpF_yNGh8Men0efsw7e4NbFXY1mMDbquvfi02WMddCECmb9L37zRy2SUrU89G.vx4WSmEk_6EG.mdLRu_GCkz8syf2v2GNraoMzKnc.xQwve.fDl7Ju_TONzPb8bwtH2lZ92Vnz9xENqVgBc._b3R5PnizCAFQfr1L.4Y2nlfMaLd.pgoh0xcgZlC5tWSVOJJs11mxMIjBbhaQyrAMHzCp8CES_hXaGXTtedQUrWlJPNgImdynyGzdq.2mhTK48pM5sbQC7Hp.g_k5iTd2PZ5l60BkFugAlFm9g6O7VW.X0Ik8vD.ZRHsEh5KnEfy08_dtepW0J4CFNlnAtj4kLuCxYH11sPqhF7V1V9ffZt.AdWWCyfHjHRWGkhUtPZewRVc_to92gRDvN_G__ssTABytloXsDUi7ys4OTCn5q4YDXh4kKrHJX0EFbDxfZlt1ToE89AQ0P1oUHJJ8s27X4kLGnn5XtGTOtmNClZL9uhLQWyRhQzw4H_lM9NDmYN7WpuHiFc7em.chDPFJp.dfNdYPy_Mcn2L6lTUUKozCqJNo6Wm9a81T..ENHScn6sbel2N7LlJm315mQODNylUFMhETQMRc9h7Ggwti2jXVGamHK4wQo0GgCNINnFY6D0TMMF7ETcEkabkYzNUblz3mVe6i8IGoaYrMaaZIUlZF92ub_rG817THWkVF9tOCSOXaL0i88CFr36uKY6xhzWQOFxhBgzCv9tG48.K0F2nqMJ5Efw_HkML6T85GLyHzm"
#           })
#       byebug
#       player_arr = player["fantasy_content"]["league"]["players"]["player"]["player_stats"]["stats"]["stat"]

#     end
#   end
# end
