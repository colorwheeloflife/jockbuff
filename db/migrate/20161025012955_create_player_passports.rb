class CreatePlayerPassports < ActiveRecord::Migration[5.0]
  def change
    create_table :player_passports do |t|
      t.belongs_to :player
      t.string :position
      t.integer :draft_position
      t.integer :yahoo_rank
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.belongs_to :team
      t.belongs_to :league
      t.timestamps
    end
  end
end
