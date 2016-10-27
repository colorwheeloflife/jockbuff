class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.boolean  :ownership
      t.string   :league_id
      t.string   :name
      t.timestamps
    end
  end
end
