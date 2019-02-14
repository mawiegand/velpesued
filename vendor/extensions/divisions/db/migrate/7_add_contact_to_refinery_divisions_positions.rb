class AddContactToRefineryDivisionsPositions < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_divisions_positions, :contact_id, :integer
  end
end
