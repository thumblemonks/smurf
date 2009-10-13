Gem::Specification.new do |s|
  s.name = "smurf"
  s.summary = "Rails plugin to automatically minify JS and CSS when their bundles get cached"
  s.description = "Rails plugin to automatically minify JS and CSS when their bundles get cached. Send in those patches!"
  s.version = "1.0.3"
  s.authors = ["Justin Knowlden"]
  s.email = %w[gus@thumblemonks.com]
  s.homepage = "http://github.com/thumblemonks/smurf"
  s.has_rdoc = true
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.post_install_message = %q{Choosy Gargamels choose Thumble Monks.}

  s.files = %w[
    MIT-LICENSE
    README.markdown
    Rakefile
    init.rb
    install.rb
    lib/smurf.rb
    lib/smurf/javascript.rb
    lib/smurf/stylesheet.rb
    rails/init.rb
    smurf.gemspec
    uninstall.rb
  ]

  s.test_files = %w[
    test/rails/app/controllers/application.rb
    test/rails/config/boot.rb
    test/rails/config/environment.rb
    test/rails/config/environments/test.rb
    test/rails/config/routes.rb
    test/rails/public/javascripts/cache/expected.js
    test/rails/public/javascripts/testing.js
    test/rails/public/stylesheets/bar.css
    test/rails/public/stylesheets/cache/expected.css
    test/rails/public/stylesheets/foo.css
    test/smurf_test.rb
    test/test_helper.rb
  ]
end
