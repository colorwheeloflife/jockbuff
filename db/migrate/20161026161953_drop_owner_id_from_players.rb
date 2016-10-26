class DropOwnerIdFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :owner_id
  end
end
