require File.expand_path('../boot', __FILE__)
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "action_controller/railtie"
require "action_view/railtie"

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module Smurf
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{config.root}/... )

    config.session_store :cookie_store, {:key => "_smurf_session"}
    config.cookie_secret = '731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b'
    
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password
  end
end
