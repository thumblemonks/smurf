require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

task :default => ["test"]

desc 'Test the smurf plugin'
Rake::TestTask.new("test") do |t|
  t.libs += ['test']
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false # Verbose is just dumb
end

