# Specifies gem version of Rails to use when vendor/rails is not present
unless defined? RAILS_GEM_VERSION
  RAILS_GEM_VERSION = (ENV['RAILS_GEM_VERSION'] || '2.3.5')
  STDOUT.puts "TESTING with RAILS_GEM_VERSION = #{RAILS_GEM_VERSION}"
end

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Don't need 'em
  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  config.action_controller.session = {
    :session_key => '_smurf_session',
    :secret      => '731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b'
  }
end
