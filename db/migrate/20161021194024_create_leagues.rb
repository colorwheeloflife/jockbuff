class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :sport
      t.string :user_team
      t.string :user_logo
      t.string :league_name
      t.string :league_key
      t.timestamps
    end
  end
end
