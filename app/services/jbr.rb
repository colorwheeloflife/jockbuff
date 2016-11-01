  require 'byebug'
  require 'yaml'
  require 'pnorm'

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
    skater_ranks = create_jbr_skaters(skater_all_arr, skater_categories)
    goalie_ranks = create_jbr_goalies(goalie_all_arr, goalie_categories)
    goalie_profiles = full_skater_profiles(goalie_ranks, goalie_all_arr.map { |rec| rec["player_id"] })
    skater_profiles = full_skater_profiles(skater_ranks, skater_all_arr.map { |rec| rec["player_id"]  })
    jock_buff_ranks = [goalie_profiles, skater_profiles]
  end

  private

  def full_skater_profiles(ranks, player_ids)
    player_id_arr = player_ids.map do |player_id|
      player_jbr = ranks.map do |category|
        cat_jbr = category[1].select do |p|
          next if p.is_a? String
          cat_jbr = p[1] if p[0] == player_id
      end
      cat_jbr =  [category[0], cat_jbr[0][1]]
    end
      player_jbr_hash = Hash[player_jbr.group_by(&:first).map{ |k,a| [k,a.map(&:last)[0]] } ]
      overall_jbr = 0
      total_jbr = player_jbr_hash.map do |key|
        overall_jbr = key[1] + overall_jbr
      end
      player_jbr_hash.merge!(jbr: (total_jbr.last/total_jbr.length).to_i, player_id: player_id)
    end
    return player_id_arr
  end

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
           player[1] = p_table_get(jbr)
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
           player[1] = p_table_get(jbr)
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

    def p_table_get(z)
      abs_z = z.abs.round(2)
      abs_z = 3.89 if abs_z > 3.89
      jbr_scaled = Pnorm[abs_z] * 100 + 50 if z > 0
      jbr_scaled = 50 - Pnorm[abs_z] * 100 if z < 0
      jbr_scaled = 50 if z == 0
      return jbr_scaled
    end
