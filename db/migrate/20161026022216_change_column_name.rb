class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :player_passports, :player_key, :player_id
  end
end
