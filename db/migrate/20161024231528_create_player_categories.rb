class CreatePlayerCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :player_categories do |t|
      t.belongs_to :league, index: true
      t.boolean :g
      t.boolean :a
      t.boolean :p
      t.boolean :plusminus
      t.boolean :pim
      t.boolean :ppg
      t.boolean :ppa
      t.boolean :ppp
      t.boolean :shg
      t.boolean :sha
      t.boolean :shp
      t.boolean :gwg
      t.boolean :gtg
      t.boolean :sog
      t.boolean :shpercent
      t.boolean :fw
      t.boolean :fl
      t.boolean :hit
      t.boolean :blk
      t.float :total

      t.timestamps
    end
  end
end
