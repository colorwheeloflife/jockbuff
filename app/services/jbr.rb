class JBR

  def jock_ranks (league_id)
    jock_buff_ranks = {}
    skater_categories = PlayerCategory.find_by(league_id: league_id).attributes
    goalie_categories = GoalieCategory.find_by(league_id: league_id).attributes
    skater_arr = PlayerPrediction.where(player_id: Player.where(type_p: "P"))
    goalie_arr = PlayerPrediction.where(player_id: Player.where(type_p: "G"))
    skater_all_arr = skater_arr.all.map do |row|
      row.attributes
    end
    goalie_all_arr = goalie_arr.all.map do |row|
      row.attributes
    end
    jock_buff_ranks.merge!({player: create_jbr_skaters(skater_all_arr, skater_categories)})
    jock_buff_ranks.merge!({goalie: create_jbr_goalies(goalie_all_arr, goalie_categories)})
    byebug
    return jock_buff_ranks
end


  private

    def create_jbr_skaters(skater_all_arr, skater_categories)
      jbr_skater_full = {}
      skater_categories.except!("id", "league_id", "created_at", "updated_at")
      skater_categories.each do |category|
        next if (category[1] == false)
        skater_cat_arr = skater_all_arr.map do |col|
           [col["player_id"], col[category[0]]]
        end
        skater_cat_stat = skater_cat_arr.map {|row| row[1]}
        skater_cat_stat = skater_cat_stat.sort
        cat_std = standard_deviation(skater_cat_stat.last(200)) unless category[0] == "fl"
        cat_mean = mean(skater_cat_stat.last(200)) unless category[0] == "fl"
        cat_std = standard_deviation(skater_cat_stat.first(200)) if category[0] == "fl"
        cat_mean = mean(skater_cat_stat.first(200)) if category[0] == "fl"
        jbr_cat_arr = skater_cat_arr.map do |player|
           jbr = (player[1] - cat_mean) / cat_std
           player[1] = jbr
           player
        end
        jbr_skater_full.merge!(category[0] => jbr_cat_arr)
      end
       return jbr_skater_full
    end

    def create_jbr_goalies(goalie_all_arr, goalie_categories)
      jbr_goalie_full = {}
      p goalie_categories
      goalie_categories.except!("id", "league_id", "created_at", "updated_at")
      goalie_categories.each do |category|
        next if (category[1] == false)
        goalie_cat_arr = goalie_all_arr.map do |col|
           [col["player_id"], col[category[0]]]
        end
        goalie_stat_cat = goalie_cat_arr.map {|row| row[1]}
        goalie_stat_cat = goalie_stat_cat.sort
        cat_std = standard_deviation(goalie_stat_cat.last(200)) unless category[0] == "l"
        cat_mean = mean(goalie_stat_cat.last(200)) unless category[0] == "l"
        cat_std = standard_deviation(goalie_stat_cat.first(200)) if category[0] == "l"
        cat_mean = mean(goalie_stat_cat.first(200)) if category[0] == "l"
        jbr_cat_arr = goalie_cat_arr.map do |player|
           jbr = (player[1] - cat_mean) / cat_std
           player[1] = jbr
           player
        end
        jbr_goalie_full.merge!(category[0] => jbr_cat_arr)
      end
       return jbr_goalie_full
    end


    def sum(arr)
      arr.inject(0){|accum, i| accum + i }
    end

    def sample_variance(arr)
      m = mean(arr)
      sum = arr.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(arr.length - 1).to_f
    end

    def mean(arr)
      sum(arr)/arr.length.to_f
    end

    def standard_deviation (arr)
      return Math.sqrt(sample_variance(arr))
    end
  end







    # if player_categories[:g] == true
    #   player_arr_g = skater_arr.sort_by do |col|
    #     col[:g]
    #   end
    #   player_arr_g = player_arr_g.sort.reverse.slice(0, 199)
    #   g_std = standard_deviation(player_arr_g)
    #   g_mean = mean(player_arr_g)
    #   jbr_g = skater_arr.map do |jbr|
    #     (jbr[:g] - g_mean) / g_std
    #   end
    # end





#     if player_categories[:g] == true
#       player_arr_g = skater_arr.sort_by do |col|
#         col[:g]
#       end
#       player_arr_g = player_arr_g.sort.reverse.slice(0, 199)
#       g_std = standard_deviation(player_arr_g)
#       g_mean = mean(player_arr_g)
#       jbr_g = skater_arr.map do |jbr|
#         (jbr[:g] - g_mean) / g_std
#       end
#     end

#      if player_categories[:a] == true
#       player_arr_g = skater_arr.sort_by do |col|
#         col[:a]
#       end
#       player_arr_a = player_arr_a.sort.reverse.slice(0, 199)
#       a_std = standard_deviation(player_arr_a)
#       a_mean = mean(player_arr_a)
#       jbr_a = skater_arr.map do |jbr|
#         (jbr[:a] - a_mean) / a_std
#       end
#     end

#      if player_categories[:p] == true
#       player_arr_g = skater_arr.sort_by do |col|
#         col[:p]
#       end
#       player_arr_p = player_arr_p.sort.reverse.slice(0, 199)
#       p_std = standard_deviation(player_arr_p)
#       p_mean = mean(player_arr_p)
#       jbr_p = skater_arr.map do |jbr|
#         (jbr[:p] - p_mean) / p_std
#       end
#     end

#      if player_categories[:plusminus] == true
#       player_arr_plusminus = skater_arr.sort_by do |col|
#         col[:plusminus]
#       end
#       player_arr_plusminus = player_arr_g.sort.reverse.slice(0, 199)
#       plusminus_std = standard_deviation(player_arr_plusminus)
#       plusminus_mean = mean(player_arr_plusminus)
#       jbr_plusminus = skater_arr.map do |jbr|
#         (jbr[:g] - plusminus_mean) / plusminus_std
#       end
#     end

#       if player_categories[:pim] == true
#       player_arr_pim = skater_arr.sort_by do |col|
#         col[:pim]
#       end
#       player_arr_pim = player_arr_pim.sort.reverse.slice(0, 199)
#       pim_std = standard_deviation(player_arr_pim)
#       pim_mean = mean(player_arr_pim)
#       jbr_pim = skater_arr.map do |jbr|
#         (jbr[:pim] - pim_mean) / pim_std
#       end
#     end

#     if player_categories[:ppg] == true
#       player_arr_ppg = skater_arr.sort_by do |col|
#         col[:ppg]
#       end
#       player_arr_ppg = player_arr_ppg.sort.reverse.slice(0, 199)
#       ppg_std = standard_deviation(ppg)
#       ppg_mean = mean(player_arr_ppg)
#       jbr_pim = skater_arr.map do |jbr|
#         (jbr[:ppg] - ppg_mean) / ppg_std
#       end
#     end


#     if player_categories[:ppa] == true
#       player_arr_ppa = skater_arr.sort_by do |col|
#         col[:ppa]
#       end
#       player_arr_ppa = player_arr_ppa.sort.reverse.slice(0, 199)
#       ppa_std = standard_deviation(ppa)
#       ppa_mean = mean(player_arr_ppa)
#       jbr_ppa = skater_arr.map do |jbr|
#         (jbr[:ppa] - ppa_mean) / ppa_std
#       end
#     end

#     if player_categories[:ppp] == true
#       player_arr_ppp = skater_arr.sort_by do |col|
#         col[:ppp]
#       end
#       player_arr_ppp = player_arr_ppp.sort.reverse.slice(0, 199)
#       ppp_std = standard_deviation(ppp)
#       ppp_mean = mean(player_arr_ppp)
#       jbr_pim = skater_arr.map do |jbr|
#         (jbr[:pim] - pim_mean) / pim_std
#       end
#     end

#       if player_categories[:shg] == true
#       player_arr_ppp = skater_arr.sort_by do |col|
#         col[:shg]
#       end
#       player_arr_shg = player_arr_ppp.sort.reverse.slice(0, 199)
#       shg_std = standard_deviation(shg)
#       shg_mean = mean(player_arr_shg)
#       jbr_pim = skater_arr.map do |jbr|
#         (jbr[:shg] - shg_mean) / shg_std
#       end
#     end

#      if player_categories[:sha] == true
#       player_arr_ppp = skater_arr.sort_by do |col|
#         col[:sha]
#       end
#       player_arr_sha = player_arr_ppp.sort.reverse.slice(0, 199)
#       sha_std = standard_deviation(sha)
#       sha_mean = mean(player_arr_sha)
#       jbr_sha = skater_arr.map do |jbr|
#         (jbr[:sha] - sha_mean) / sha_std
#       end
#     end

#      if player_categories[:shp] == true
#       player_arr_shp = skater_arr.sort_by do |col|
#         col[:shp]
#       end
#       player_arr_shp = player_arr_shp.sort.reverse.slice(0, 199)
#       shp_std = standard_deviation(sha)
#       shp_mean = mean(player_arr_sha)
#       jbr_shp = skater_arr.map do |jbr|
#         (jbr[:shp] - shp_mean) / shp_std
#       end
#     end

#         if player_categories[:gwg] == true
#       player_arr_gwg = skater_arr.sort_by do |col|
#         col[:gwg]
#       end
#       player_arr_gwg = player_arr_gwg.sort.reverse.slice(0, 199)
#       gwg_std = standard_deviation(sha)
#       gwg_mean = mean(player_arr_sha)
#       jbr_gwg = skater_arr.map do |jbr|
#         (jbr[:gwg] - gwg_mean) / gwg_std
#       end
#     end

#         if player_categories[:gtg] == true
#       player_arr_gtg = skater_arr.sort_by do |col|
#         col[:gtg]
#       end
#       player_arr_gtg = player_arr_gtg.sort.reverse.slice(0, 199)
#       gtg_std = standard_deviation(gtg)
#       gtg_mean = mean(player_arr_gtg)
#       jbr_gtg = skater_arr.map do |jbr|
#         (jbr[:gtg] - gtg_mean) / gtg_std
#       end
#     end

#            if player_categories[:gtg] == true
#       player_arr_gtg = skater_arr.sort_by do |col|
#         col[:gtg]
#       end
#       player_arr_gtg = player_arr_gtg.sort.reverse.slice(0, 199)
#       gtg_std = standard_deviation(gtg)
#       gtg_mean = mean(player_arr_gtg)
#       jbr_gtg = skater_arr.map do |jbr|
#         (jbr[:gtg] - gtg_mean) / gtg_std
#       end
#     end








#     end




#     end







#     if player_categories[:g] == true
#       player_arr_g = skater_arr.sort_by do |col|
#         col[:g]
#       end
#       player_arr_g = player_arr_g.sort.reverse.slice(0, 199)
#       g_std = standard_deviation(player_arr_g)
#       g_mean = mean(player_arr_g)
#       jbr_g = skater_arr.map do |jbr|
#         (jbr[:g] - g_mean) / g_std
#       end
#     end

# end
