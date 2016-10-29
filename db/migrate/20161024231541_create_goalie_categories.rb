class CreateGoalieCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :goalie_categories do |t|
      t.belongs_to :league, index: true
      t.boolean :gs
      t.boolean :w
      t.boolean :l
      t.boolean :ga
      t.boolean :gaa
      t.boolean :sa
      t.boolean :sec
      t.boolean :sv
      t.boolean :svpercent
      t.boolean :sho

      t.timestamps
    end
  end
end
