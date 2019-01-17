module Refinery
  module Facilities
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Facilities

      engine_name :refinery_facilities

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "facilities"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.facilities_admin_facilities_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Facilities)
      end
    end
  end
end
