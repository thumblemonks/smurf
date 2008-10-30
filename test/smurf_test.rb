require File.join(File.dirname(__FILE__), 'test_helper')

class SmurfTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  context "when caching on" do
    setup do
      ActionController::Base.stubs(:perform_caching).returns(true)
      javascript_include_tag('testing.js',
        :cache => 'cache/actual')
    end

    should_have_same_contents('javascripts/cache/expected.js',
      'javascripts/cache/actual.js')
  end
end
