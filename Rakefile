require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'lib/test/**/*_test.rb'
  t.verbose = false
end

task :default => :test



