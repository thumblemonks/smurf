ENV["RAILS_ENV"] = "test"
require ::File.expand_path('../rails/config/environment',  __FILE__)

# Rails.public_path = Rails.root + "test" + "rails" + "public"
require 'riot'
require 'ostruct'

# require 'smurf'
require ::File.expand_path('../../lib/smurf',  __FILE__)

class AssetFile
  def self.base_path
    @path ||= Rails.public_path
  end

  def self.read(relative_path)
    File.read(base_path + relative_path)
  end
end

class Riot::Context
  def should_have_same_contents(expected_path, actual_path)
    asserts "#{actual_path} has the same file contents as #{expected_path}" do
      AssetFile.read(actual_path)
    end.equals(AssetFile.read(expected_path))
  end
end

class Riot::Situation
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper

  def controller; nil; end

  def config
    OpenStruct.new({
      :assets_dir => Rails.public_path,
      :javascripts_dir => Rails.public_path + "/javascripts",
      :stylesheets_dir => Rails.public_path + "/stylesheets",
      :perform_caching => true
    })
  end
end

at_exit do
  artifacts = Dir.glob(File.join(AssetFile.base_path, '**', 'cache', 'actual*.*'))
  FileUtils.rm(artifacts)
end
