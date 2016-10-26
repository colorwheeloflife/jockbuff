class DropOwners < ActiveRecord::Migration[5.0]
   def up
    drop_table :owners
  end
end
