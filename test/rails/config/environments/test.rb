Smurf::Application.configure do
  config.cache_classes = true
  config.whiny_nils = true

  config.action_controller.consider_all_requests_local = true
  config.action_controller.perform_caching             = true # THIS IS IMPORTANT FOR THE TESTS
end