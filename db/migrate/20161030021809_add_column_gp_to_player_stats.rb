class AddColumnGpToPlayerStats < ActiveRecord::Migration[5.0]
  def change
    add_column :player_stats, :gp, :integer
    add_column :player_stats, :sec, :integer
    add_column :player_predictions, :sec, :integer
  end
end
