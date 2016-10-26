class AddFieldsToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :ownership, :boolean
    add_column :teams, :league_id, :string
  end
end
