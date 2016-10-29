class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players, id:false, force: true do |t|
      t.integer :player_id, null: false
      t.string :name
      t.string :positions, array: true
      t.string :pro_team
      t.string :type_p
      t.timestamps
    end
    add_index "players", ["player_id"], name: "index_players_on_player_id", unique: true
  end
end

# http://ruby-journal.com/how-to-override-default-primary-key-id-in-rails/