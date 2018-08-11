class CreateDivisionsGroups < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_divisions_groups do |t|
      t.string :name
      t.integer :photo_id
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
      ::Refinery::Page.delete_all({:link_url => "/divisions/groups"})
    end

    drop_table :refinery_divisions_groups

  end

end
