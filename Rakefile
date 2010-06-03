require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the smurf plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs += ['test']
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false # Verbose is just dumb
end

#
# Some monks like diamonds. I like gems.

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "smurf"
    gem.summary = "Rails plugin to automatically minify JS and CSS when their bundles get cached"
    gem.description = "Rails plugin to automatically minify JS and CSS when their bundles get cached. Send in those patches!"
    gem.email = "gus@thumblemonks.com"
    gem.homepage = "http://github.com/thumblemonks/smurf"
    gem.authors = ["Justin 'Gus' Knowlden"]
    gem.add_development_dependency "riot"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end