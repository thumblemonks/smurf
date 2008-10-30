ENV["RAILS_ENV"] = "test"
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
# load(File.dirname(__FILE__) + "/../db/schema.rb")

require 'test_help'
require 'ruby-debug'

class Test::Unit::TestCase

  def teardown
    artifacts = Dir.glob(File.join(asset_path, '**', 'cache', 'actual.*'))
    FileUtils.rm(artifacts)
  end
  
  def self.should_have_same_contents(expected_path, actual_path)
    should "have the same file contents as #{expected_path}" do
      expected = read_asset_file(expected_path)
      actual = read_asset_file(actual_path)
      assert_equal expected, actual
    end
  end

private
  def asset_path
    File.join(File.dirname(__FILE__), '..', 'public')
  end

  def read_asset_file(relative_path)
    File.read(File.join(asset_path, relative_path))
  end
end
