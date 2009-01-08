
Gem::Specification.new do |s|
  s.name = "smurf"
  s.summary = "Rails plugin to automatically minify JS and CSS when their bundles get cached"
  s.version = "1.0.0"
  s.authors = ["Justin Knowlden"]
  s.homepage = "http://github.com/thumblemonks/smurf"
  s.files = ["config/boot.rb",
             "config/routes.rb",
             "config/environments/test.rb",
             "config/database.yml",
             "config/environment.rb",
             "init.rb",
             "install.rb",
             "uninstall.rb",
             "rails/init.rb",
             "Rakefile",
             "README.markdown",
             "smurf.gemspec",
             "lib/smurf/stylesheet.rb",
             "lib/smurf/javascript.rb",
             "lib/smurf.rb",
             "MIT-LICENSE"]
  s.test_files = ["app/controllers/application.rb",
                  "public/stylesheets/bar.css",
                  "public/stylesheets/cache",
                  "public/stylesheets/cache/expected.css",
                  "public/stylesheets/foo.css",
                  "public/javascripts",
                  "public/javascripts/cache",
                  "public/javascripts/cache/expected.js",
                  "public/javascripts/testing.js",
                  "test/smurf_test.rb",
                  "test/test_helper.rb"]
end
