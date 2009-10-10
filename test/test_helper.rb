ENV["RAILS_ENV"] = "test"
ENV["RAILS_ROOT"] = File.expand_path(File.join(File.dirname(__FILE__), 'rails'))
require File.expand_path(File.join(ENV["RAILS_ROOT"], 'config', 'environment'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'init'))

require 'riot'

class AssetFile
  def self.base_path
    @path ||= File.join(File.join(ENV["RAILS_ROOT"], 'public'))
  end

  def self.read(relative_path)
    File.read(File.join(base_path, relative_path))
  end
end

class Riot::Context
  def should_have_same_contents(expected_path, actual_path)
    asserts "#{actual_path} has the same file contents as #{expected_path}" do
      AssetFile.read(actual_path)
    end.equals(AssetFile.read(expected_path))
  end
end

Riot::Situation.instance_eval do
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
end

at_exit do
  artifacts = Dir.glob(File.join(AssetFile.base_path, '**', 'cache', 'actual.*'))
  FileUtils.rm(artifacts)
end
