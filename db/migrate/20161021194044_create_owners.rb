class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners, id:false, force: true do |t|
      t.string :team_id, null: false
      t.string :name
      t.belongs_to :league, index: true
      t.string :players, array: true
      t.timestamps
    end
    add_index "owners", ["team_id"], name: "index_owners_on_team_id", unique: true
  end
end
