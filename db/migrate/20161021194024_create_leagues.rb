class CreateLeagues < ActiveRecord::Migration[5.0]
  def change

    create_table :leagues do |t|
      t.string :name
      t.belongs_to :user_id, index: true
      t.string :sport
      t.string :user_team
      t.string :user_logo
      t.string :league_name
      t.timestamps
    end
  end
end
