Smurf::Application.configure do
  config.active_support.deprecation = :stderr
  config.cache_classes = true
  config.whiny_nils = true

  config.action_controller.perform_caching             = true # THIS IS IMPORTANT FOR THE TESTS
end