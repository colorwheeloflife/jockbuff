class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.belongs_to :league, index: true
      t.string :players, array: true
      t.timestamps
    end
  end
end
