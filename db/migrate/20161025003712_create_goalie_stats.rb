class CreateGoalieStats < ActiveRecord::Migration[5.0]
  def change
    create_table :goalie_stats do |t|
      t.belongs_to :player, index: true
      t.integer :gs
      t.integer :w
      t.integer :l
      t.integer :ga
      t.float :gaa
      t.integer :sa
      t.integer :sv
      t.float :svpercent
      t.integer :sho
      t.float :total

      t.timestamps
    end
  end
end
