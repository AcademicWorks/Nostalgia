# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nostalgia/version'

Gem::Specification.new do |spec|
  spec.name          = "nostalgia"
  spec.version       = Nostalgia::VERSION
  spec.authors       = ["Aaron Scruggs"]
  spec.email         = ["aaron@scrug.gs"]
  spec.description   = %q{Often I want to evaluate what changed on an object after it has saved and has been transactionally committed.  One use case is enqueuenig a background job when a specific attribute changed.  Typically you should wait until after_commit to enqueue the job.  This ensures that your workers will have access to the updates that were being made inside the transaction. This is a problem because ActiveRecord forgets the changes after_save.  This gem keeps those changes around for later inspection and evaluation.}
  spec.summary       = %q{Remember changes on ActiveRecord models even after they are saved.}
  spec.homepage      = "http://github.com/AcademicWorks/nostalgia"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
