class AddPositionsFromPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :positions, :string, array: true
  end
end
