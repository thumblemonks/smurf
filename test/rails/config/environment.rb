# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
unless defined? RAILS_GEM_VERSION
  RAILS_GEM_VERSION = (ENV['RAILS_GEM_VERSION'] || '2.3.2')
end

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'thoughtbot-shoulda', :lib => 'shoulda/rails',
    :source => 'http://gems.github.com'
  config.gem 'sqlite3-ruby', :lib => 'sqlite3'

  config.action_controller.session = {
    :session_key => '_smurf_session',
    :secret      => '731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b731d6426b'
  }
end
