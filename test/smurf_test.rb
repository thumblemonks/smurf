require File.join(File.dirname(__FILE__), 'test_helper')

class SmurfTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper

  context "when caching on for javascript" do
    setup do
      ActionController::Base.stubs(:perform_caching).returns(true)
      javascript_include_tag('testing.js', :cache => 'cache/actual')
    end

    should_have_same_contents('javascripts/cache/expected.js',
      'javascripts/cache/actual.js')
  end

  context "when caching on for stylesheets" do
    setup do
      ActionController::Base.stubs(:perform_caching).returns(true)
      stylesheet_link_tag('foo', 'bar', :cache => 'cache/actual')
    end

    should_have_same_contents('stylesheets/cache/expected.css',
      'stylesheets/cache/actual.css')
  end
end
