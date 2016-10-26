class AddLeagueIdToPlayerPassport < ActiveRecord::Migration[5.0]
  def change
    add_column :player_passports, :league_id, :string
  end
end
