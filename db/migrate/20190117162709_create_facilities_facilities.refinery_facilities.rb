# This migration comes from refinery_facilities (originally 1)
class CreateFacilitiesFacilities < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_facilities do |t|
      t.string :name
      t.integer :photo_id
      t.string :address
      t.string :maps_link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-facilities"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/facilities/facilities"})
    end

    drop_table :refinery_facilities

  end

end
