n

# player_ids = [4002, 4519, 35]
#     player_id_arr = player_ids.map do |player_id|
#       player_jbr = skaters.map do |category|
#         cat_jbr = category[1].select do |p|
#           next if p.is_a? String
#           cat_jbr = p[1] if p[0] == player_id
#       end
#       cat_jbr =  [category[0], cat_jbr[0][1]]
#     end
#       p player_jbr
#       player_jbr_hash = Hash[player_jbr.group_by(&:first).map{ |k,a| [k,a.map(&:last)[0]] } ]
#       player_jbr_hash.merge!(player_id: player_id)
#     end
# byebug

#   # player_jbr = player_jbr.flat_map{|x| x}.to_h
#   p player_jbr



# to obtain hash
# require 'csv'
# require 'byebug'


#   ptable = File.read('./pnorm.csv')
#   ptable_parse = CSV.parse(ptable, :headers => true, :encoding => 'ISO-8859-1')
#   p_table = ptable_parse.map do |row|
#     row.to_hash
#   end

#   p p_table

#   p_table.map! do |hash|
#     new_keys = hash.map do |key|
#       col = [(key[0].to_f + hash["Z"].to_f).round(2)]
#       val = key[1].to_f.round(2)
#       combo = col.push(val)
#       combo
#     end
#   end

#   p_table.map! {|arr| arr[1..-1]}

#   p p_table

#   p_table = p_table.flat_map{|x| x}.to_h

#   p p_table