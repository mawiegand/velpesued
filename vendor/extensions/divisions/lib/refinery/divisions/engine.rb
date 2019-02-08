module Refinery
  module Divisions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Divisions

      engine_name :refinery_divisions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "divisions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.divisions_admin_divisions_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/divisions(?!/(groups|positions))(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Divisions)
      end
    end
  end
end
