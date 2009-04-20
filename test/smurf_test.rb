require File.join(File.dirname(__FILE__), 'test_helper')

class SmurfTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper

  # Javascript

  context "when caching on for javascript" do
    setup do
      ActionController::Base.stubs(:perform_caching).returns(true)
      javascript_include_tag('testing.js', :cache => 'cache/actual')
    end

    should_have_same_contents('javascripts/cache/expected.js',
      'javascripts/cache/actual.js')
  end # when caching on for javascript

  context "minifying multi-line strings in javascript" do
    setup do
      input = StringIO.new()
      input.puts("var foo='bar \\")
      input.puts("  bar \\")
      input.puts("  baz';")
      input.rewind
      @content = input.read
    end

    should "not affect the string" do
      expected = "\n" + @content.gsub(/\\?\r?\n/, '')
      assert_equal expected, Smurf::Javascript.new(@content).minified
    end
  end

  # Stylesheet

  context "when caching on for stylesheets" do
    setup do
      ActionController::Base.stubs(:perform_caching).returns(true)
      stylesheet_link_tag('foo', 'bar', :cache => 'cache/actual')
    end

    should_have_same_contents('stylesheets/cache/expected.css',
      'stylesheets/cache/actual.css')
  end # when caching on for stylesheets

  context "minifying a non-existent pattern in a stylesheet" do
    setup {@himom = "hi{mom:super-awesome}"}

    # Thanks to someone named Niko for finding this
    should "succeed for removing comments" do
      actual = "hi {  mom:  super-awesome; } "
      assert_equal @himom, Smurf::Stylesheet.new(actual).minified
    end

    should "succeed when no spaces to compress" do
      actual = @himom
      assert_equal @himom, Smurf::Stylesheet.new(actual).minified
    end

    should "succeed when no outside or inside blocks" do
      # nothing outside, means nothing inside. they are complementary
      actual = "how-did:  this-happen;  typo: maybe;}"
      expected = "how-did: this-happen; typo: maybe}"
      assert_equal expected, Smurf::Stylesheet.new(actual).minified
    end

    should "succeed when no last semi-colon in block" do
      actual = "hi {  mom:  super-awesome } "
      assert_equal @himom, Smurf::Stylesheet.new(actual).minified
    end

    should "succeed across all parsers when no content provided" do
      actual = ""
      assert_equal "", Smurf::Stylesheet.new(actual).minified
    end

    should "succeed if nil provided" do
      assert_nil Smurf::Stylesheet.new(nil).minified
    end
  end # minifying a non-existent pattern
end
