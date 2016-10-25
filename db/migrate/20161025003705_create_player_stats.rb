class CreatePlayerStats < ActiveRecord::Migration[5.0]
  def change
    create_table :player_stats do |t|
      t.belongs_to :player, index = true
      t.integer :g
      t.integer :a
      t.integer :p
      t.integer :plusminus
      t.integer :pim
      t.integer :ppg
      t.integer :ppp
      t.integer :shg
      t.integer :sha
      t.integer :shp
      t.integer :gwg
      t.integer :gtg
      t.integer :sog
      t.float :shpercent
      t.integer :fw
      t.integer :fl
      t.integer :hit
      t.integer :blk
      t.float :total
      t.timestamps
    end
  end
end
