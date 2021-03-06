# This migration comes from refinery_divisions (originally 6)
class CreateDivisionsPositions < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_divisions_positions do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-divisions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/divisions/positions"})
    end

    drop_table :refinery_divisions_positions

  end

end
