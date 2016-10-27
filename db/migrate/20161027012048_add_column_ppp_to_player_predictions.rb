class AddColumnPppToPlayerPredictions < ActiveRecord::Migration[5.0]
  def change
    add_column :player_predictions, :ppa, :integer
  end
end
