module Refinery
  class ContactsGenerator < Rails::Generators::Base

    def rake_db
      rake "refinery_contacts:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Contacts extension
Refinery::Contacts::Engine.load_seed
        EOH
      end
    end
  end
end
