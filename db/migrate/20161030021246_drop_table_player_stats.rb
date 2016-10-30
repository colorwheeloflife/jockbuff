class DropTablePlayerStats < ActiveRecord::Migration[5.0]
  def change
    drop_table :player_stats do |t|
      t.belongs_to :player, index = true
      t.integer :g
      t.integer :a
      t.integer :p
      t.integer :plusminus
      t.integer :pim
      t.integer :ppg
      t.integer :ppp
      t.integer :ppa
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
      t.integer :gs
      t.integer :w
      t.integer :l
      t.integer :ga
      t.float :gaa
      t.integer :sa
      t.integer :sv
      t.float :svpercent
      t.integer :sho
      t.timestamps
    end
  end
end