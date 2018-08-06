# This migration comes from refinery_divisions (originally 3)
class AddDivisionToRefineryDivisionsGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_divisions_groups, :division_id, :integer
  end
end
