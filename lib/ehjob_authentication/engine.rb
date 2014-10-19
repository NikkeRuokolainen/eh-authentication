module EhjobAuthentication
  class Engine < ::Rails::Engine
    isolate_namespace EhjobAuthentication
    config.autoload_paths << config.root.join('app', 'lib')
    config.i18n.load_path += Dir[config.root.join('config', 'locales', '*.yml').to_s]

    config.after_initialize do
      User.connection
      User.instance_eval do
        include EhjobAuthentication::Roleable
      end
    end
  end
end
