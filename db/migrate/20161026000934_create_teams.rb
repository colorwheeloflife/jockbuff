class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :league, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.boolean  :ownership
      t.string  :name
      t.string :image
      t.string :nickname
      t.string :url
      t.timestamps
    end
  end
end
