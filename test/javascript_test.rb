require 'test_helper'

context "Javascript minifier" do

  should "want to minify files in the javascripts directory" do
    Smurf::Javascript.minifies?(["a/b/javascripts/bar.js", "c/d/javascripts/baz.js"])
  end

  should "want to minify files in the stylesheets directory" do
    Smurf::Javascript.minifies?(["a/b/stylesheets/bar.js", "c/d/stylesheets/baz.js"])
  end

  should "want to minify nothing but stylesheets" do
    Smurf::Javascript.minifies?(["a/b/javascripts/bar.css", "c/d/javascripts/baz.css"])
  end.not!

  context "working with multi-line strings" do
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
  end # working with multi-line strings
end # Javascript minifier
