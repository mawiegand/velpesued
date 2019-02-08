class AddManageableToRefineryDivisionsPositions < ActiveRecord::Migration[5.1]
  def change
    add_reference :refinery_divisions_positions, :manageable, polymorphic: true, index: {:name => 'index_refinery_divisions_positions_on_manageable_type_and_id'}
  end
end
