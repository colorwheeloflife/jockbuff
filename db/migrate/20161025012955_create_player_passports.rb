class CreatePlayerPassports < ActiveRecord::Migration[5.0]
  def change
    create_table :player_passports do |t|
      t.string   :player_id
      t.string   :position
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer  :team_id
      t.string   :league_id
      t.timestamps
    end
  end
end
