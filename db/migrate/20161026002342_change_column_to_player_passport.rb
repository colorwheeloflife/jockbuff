class ChangeColumnToPlayerPassport < ActiveRecord::Migration[5.0]

  def up
      add_column :player_passports, :team_id, :integer
  end

    def down
      remove_column :player_passports, :owner_id, :integer
    end
end

