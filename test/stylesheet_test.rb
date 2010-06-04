require 'test_helper'

context "Stylesheet minifier" do
  setup { Smurf::Stylesheet }
  helper(:minify) { |content| topic.new(content).minified }

  should "want to minify files in the stylesheets directory" do
    topic.minifies?(["a/b/stylesheets/bar.css", "c/d/stylesheets/baz.css?12344"])
  end

  should "want to minify files in the javascripts directory" do
    topic.minifies?(["a/b/javascripts/bar.css?12345", "c/d/javascripts/baz.css"])
  end

  should "want to minify nothing but javascripts" do
    topic.minifies?(["a/b/stylesheet/foo.js", "c/d/javascripts/baz.js"])
  end.not!

  context "minifying a non-existent pattern in a stylesheet" do
    should("succeed for removing comments") do
      minify("hi {  mom:  super-awesome; } ")
    end.equals("hi{mom:super-awesome}")

    should("succeed when no spaces to compress") do
      minify("hi{mom:super-awesome}")
    end.equals("hi{mom:super-awesome}")

    # nothing outside, means nothing inside. they are complementary
    should "succeed when no outside or inside blocks" do
      minify("how-did:  this-happen;  typo: maybe;}")
    end.equals("how-did: this-happen; typo: maybe}")

    asserts "when no last semi-colon in block" do
      minify("hi {  mom:  super-awesome } ")
    end.equals("hi{mom:super-awesome}")

    asserts("empty string when no content provided") { minify("") }.equals("")

    asserts("nil even if nil provided") { minify(nil) }.nil
  end # minifying a non-existent pattern in a stylesheet
end # Stylesheet minifier
