class AddDraftPositionPp < ActiveRecord::Migration[5.0]
  def change
    add_column :player_passports, :draft_position, :integer
  end
end
