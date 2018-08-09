# This migration comes from refinery_divisions (originally 4)
class AddSlugToRefineryDivisions < ActiveRecord::Migration[5.1]
  def up
    # create slug column with index
    add_column :refinery_divisions, :slug, :string
    add_index :refinery_divisions, :slug, unique: true

    # create slug for existing divisions
    ::Refinery::Divisions::Division.find_each(&:save)

    # prevent null in slug column
    change_column :refinery_divisions, :slug, :string, null: false
  end

  def down
    remove_column :refinery_divisions, :slug
  end
end
