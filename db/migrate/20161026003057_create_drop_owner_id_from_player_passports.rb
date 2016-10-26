class CreateDropOwnerIdFromPlayerPassports < ActiveRecord::Migration[5.0]

    def down
      remove_column :player_passports, :owner_id
    end

end

