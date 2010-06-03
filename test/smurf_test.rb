require 'test_helper'

# Javascript

context "link tags when caching on" do
  setup do
    javascript_include_tag('testing', :cache => 'cache/actual')
    stylesheet_link_tag('foo', 'bar', '/javascripts/projwcss/jscss', :cache => 'cache/actual')
  end

  should_have_same_contents('javascripts/cache/expected.js', 'javascripts/cache/actual.js')
  should_have_same_contents('stylesheets/cache/expected.css', 'stylesheets/cache/actual.css')
end # link tags when caching on

context "minifying multi-line strings in javascript" do
  setup do
    input = StringIO.new()
    input.puts("var foo='bar \\")
    input.puts("  bar \\")
    input.puts("  baz';")
    input.rewind
    input.read
  end

  should "not affect the string" do
    Smurf::Javascript.new(topic).minified
  end.equals("\nvar foo='bar   bar   baz';")
end

context "minifying a non-existent pattern in a stylesheet" do
  # Thanks to someone named Niko for finding this
  should "succeed for removing comments" do
    Smurf::Stylesheet.new("hi {  mom:  super-awesome; } ").minified
  end.equals("hi{mom:super-awesome}")

  should "succeed when no spaces to compress" do
    Smurf::Stylesheet.new("hi{mom:super-awesome}").minified
  end.equals("hi{mom:super-awesome}")

  # nothing outside, means nothing inside. they are complementary
  should "succeed when no outside or inside blocks" do
    Smurf::Stylesheet.new("how-did:  this-happen;  typo: maybe;}").minified
  end.equals("how-did: this-happen; typo: maybe}")

  asserts "when no last semi-colon in block" do
    Smurf::Stylesheet.new("hi {  mom:  super-awesome } ").minified
  end.equals("hi{mom:super-awesome}")

  asserts "empty string when no content provided" do
    Smurf::Stylesheet.new("").minified
  end.equals("")

  asserts "nil even if nil provided" do
    Smurf::Stylesheet.new(nil).minified
  end.nil
end # minifying a non-existent pattern in a stylesheet
