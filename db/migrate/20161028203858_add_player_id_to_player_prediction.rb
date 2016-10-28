class AddPlayerIdToPlayerPrediction < ActiveRecord::Migration[5.0]
  def change
    add_column :player_predictions, :player_id, :integer
  end
end
