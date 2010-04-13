require 'test_helper'

context "minifying a non-existent pattern in a stylesheet" do
  setup { Smurf::Stylesheet }

  should "want to minify files in the stylesheets directory" do
    topic.minifies?(["a/b/stylesheets/bar.css", "c/d/stylesheets/baz.css"])
  end

  should "not want to minify files in the javascripts directory" do
    topic.minifies?(["a/b/javascripts/bar.css", "c/d/javascripts/baz.css"])
  end.not!


  # Thanks to someone named Niko for finding this
  should "succeed for removing comments" do
    topic.new("hi {  mom:  super-awesome; } ").minified
  end.equals("hi{mom:super-awesome}")

  should "succeed when no spaces to compress" do
    topic.new("hi{mom:super-awesome}").minified
  end.equals("hi{mom:super-awesome}")

  # nothing outside, means nothing inside. they are complementary
  should "succeed when no outside or inside blocks" do
    topic.new("how-did:  this-happen;  typo: maybe;}").minified
  end.equals("how-did: this-happen; typo: maybe}")

  asserts "when no last semi-colon in block" do
    topic.new("hi {  mom:  super-awesome } ").minified
  end.equals("hi{mom:super-awesome}")

  asserts "empty string when no content provided" do
    topic.new("").minified
  end.equals("")

  asserts "nil even if nil provided" do
    topic.new(nil).minified
  end.nil
end # minifying a non-existent pattern in a stylesheet
