class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :team_key
      t.string :league_key
      t.string :team_name
      t.string :logo
      t.string :league_name
      t.string :sport

      t.timestamps
    end
  end
end
