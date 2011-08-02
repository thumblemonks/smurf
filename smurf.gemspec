# -*- encoding: utf-8 -*-
$:.unshift(File.expand_path("../lib", __FILE__))
require "smurf/version"

Gem::Specification.new do |s|
  s.name          = %q{smurf}
  s.version       = Smurf::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Justin 'Gus' Knowlden"]
  s.summary       = %q{Rails plugin to automatically minify JS and CSS when their bundles get cached.}
  s.description   = %q{Rails plugin to automatically minify JS and CSS when their bundles get cached. Send in those patches!}
  s.email         = %q{gus@gusg.us}
  s.files         = `git ls-files`.split("\n") 
  s.homepage      = %q{http://github.com/thumblemonks/smurf}
  s.require_paths = ["lib"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ["README.markdown"]

  s.add_dependency 'rails', '3.0.3'
  s.add_dependency 'riot', '>=0.12.0'
end


