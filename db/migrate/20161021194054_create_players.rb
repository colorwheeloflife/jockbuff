class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players, id:false, force: true do |t|
      t.string :player_key, null: false
      t.string :name
      t.string :positions, array: true
      t.string :pro_team
      t.integer :owner_id

      t.timestamps
    end
    add_index "players", ["player_key"], name: "index_players_on_player_key", unique: true
  end
end

# http://ruby-journal.com/how-to-override-default-primary-key-id-in-rails/