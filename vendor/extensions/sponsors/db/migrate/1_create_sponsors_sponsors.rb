class CreateSponsorsSponsors < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_sponsors do |t|
      t.string :name
      t.integer :logo_id
      t.string :link_url
      t.boolean :published
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sponsors"})
    end

    drop_table :refinery_sponsors

  end

end
