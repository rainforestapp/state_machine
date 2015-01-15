if defined?(Rails)
  # Track all of the applicable locales to load
  locale_paths = []
  StateMachine::Integrations.all.each do |integration|
    locale_paths << integration.locale_path if integration.available? && integration.locale_path
  end

  if defined?(Rails::Engine)
    class StateMachine::RailsEngine < Rails::Engine
      paths['config/locales'] = locale_paths
    end
  end
end
