class AddTablePlayerStats < ActiveRecord::Migration[5.0]
  def change
    create_table :player_stats, id:false, force: true do |t|
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
      t.integer :sec
      t.float :svpercent
      t.integer :sho
      t.integer :player_id

      t.timestamps
    end
  end
end
