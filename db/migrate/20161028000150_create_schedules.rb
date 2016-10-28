class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :team_name
      t.integer :week_1
      t.integer :week_2
      t.integer :week_3
      t.integer :week_4
      t.integer :week_5
      t.integer :week_6
      t.integer :week_7
      t.integer :week_8
      t.integer :week_9
      t.integer :week_10
      t.integer :week_11
      t.integer :week_12
      t.integer :week_13
      t.integer :week_14
      t.integer :week_15
      t.integer :week_16
      t.integer :week_17
      t.integer :week_18
      t.integer :week_19
      t.integer :week_20
      t.integer :week_21
      t.integer :week_22
      t.integer :week_23
      t.integer :week_24

      t.timestamps
    end
  end
end
