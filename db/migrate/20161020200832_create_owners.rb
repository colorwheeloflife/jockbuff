class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.integer :league_id

      t.timestamps
    end
  end
end
