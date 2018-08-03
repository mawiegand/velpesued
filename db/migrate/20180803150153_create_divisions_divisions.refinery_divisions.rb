# This migration comes from refinery_divisions (originally 1)
class CreateDivisionsDivisions < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_divisions do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-divisions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/divisions/divisions"})
    end

    drop_table :refinery_divisions

  end

end
