class CreatePlayerPassports < ActiveRecord::Migration[5.0]
  def change
    create_table :player_passports do |t|
      t.integer :owner_id
      t.string :player_id
      t.string :position
      t.timestamps
    end
  end
end
