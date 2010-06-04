require 'test_helper'

context "link tags when caching on" do
  setup do
    javascript_include_tag('testing', :cache => 'cache/actual')
    stylesheet_link_tag('foo', 'bar', :cache => 'cache/actual-basic')
    stylesheet_link_tag('foo', 'bar', '/javascripts/projwcss/jscss', :cache => 'cache/actual-plus')
  end

  should_have_same_contents('/javascripts/cache/expected.js', '/javascripts/cache/actual.js')
  should_have_same_contents('/stylesheets/cache/expected-basic.css', '/stylesheets/cache/actual-basic.css')
  should_have_same_contents('/stylesheets/cache/expected-plus.css', '/stylesheets/cache/actual-plus.css')
end # link tags when caching on
