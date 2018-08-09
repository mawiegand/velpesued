class AddSlugToRefineryDivisionsGroups < ActiveRecord::Migration[5.1]
  def up
    # create slug column with index
    add_column :refinery_divisions_groups, :slug, :string
    add_index :refinery_divisions_groups, :slug, unique: true

    # create slug for existing groups
    ::Refinery::Divisions::Group.find_each(&:save)

    # prevent null in slug column
    change_column :refinery_divisions_groups, :slug, :string, null: false
  end

  def down
    remove_column :refinery_divisions_groups, :slug
  end
end
