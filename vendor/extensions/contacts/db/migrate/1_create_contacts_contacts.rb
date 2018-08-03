class CreateContactsContacts < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_contacts do |t|
      t.string :name
      t.integer :photo_id
      t.string :mail
      t.string :phone
      t.string :mobile
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contacts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contacts/contacts"})
    end

    drop_table :refinery_contacts

  end

end
