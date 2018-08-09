module Refinery
  module Divisions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Divisions

      engine_name :refinery_divisions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "groups"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.divisions_admin_groups_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/divisions/groups(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Groups)
      end
    end
  end
end
