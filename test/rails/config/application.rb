require File.expand_path('../boot', __FILE__)
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "action_controller/railtie"
require "action_view/railtie"

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module Smurf
  class Application < Rails::Application
    config.session_store :cookie_store, {:key => "_smurf_session"}
    config.secret_token = "i own you." * 3
    
    config.root = File.expand_path(File.join(File.dirname(__FILE__), ".."))
  end
end
