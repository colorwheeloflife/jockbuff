class RemoveOwnersIdFromPlayerPassports < ActiveRecord::Migration[5.0]
  def change
    remove_column :player_passports, :owner_id, :integer
  end
end
