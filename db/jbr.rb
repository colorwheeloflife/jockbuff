
require 'csv'

predictions = File.read(Rails.root.join('lib', 'seeds', 'predictions.csv'))
col_data = []
CSV.foreach(predictions) {|row| col_data << row[COL_INDEX]}
p col_data
