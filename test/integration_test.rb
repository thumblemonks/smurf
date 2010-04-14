require 'test_helper'

context "link tags when caching on" do
  setup do
    javascript_include_tag('testing', "cache" => 'cache/actual')
    stylesheet_link_tag('foo', 'bar', "cache" => 'cache/actual')
  end

  should_have_same_contents('javascripts/cache/expected.js', 'javascripts/cache/actual.js')
  should_have_same_contents('stylesheets/cache/expected.css', 'stylesheets/cache/actual.css')
end # link tags when caching on
