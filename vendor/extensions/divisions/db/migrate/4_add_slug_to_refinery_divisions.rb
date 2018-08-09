class AddSlugToRefineryDivisions < ActiveRecord::Migration[5.1]
  def change
    # create slug column with index
    add_column :refinery_divisions, :slug, :string
    add_index :refinery_divisions, :slug, unique: true

    # create slug for existing divisions
    ::Refinery::Divisions::Division.find_each(&:save)

    # prevent null in slug column
    change_column :refinery_divisions, :slug, :string, null: false
  end
end
