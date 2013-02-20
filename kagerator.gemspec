$:.push File.expand_path('../lib', __FILE__)
require 'kagerator/version'

Gem::Specification.new do |gem|
  gem.name        = 'kagerator'
  gem.version     = Kagerator::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.summary     = 'Easy consumption of the KAG API'
  gem.description = 'Easy, quick consumption and reading of the King Arthur\'s Gold Public API'
  gem.licenses    = %w(GPLv2)

  gem.authors     = ['Shaun McCormick']
  gem.email       = %w(splittingred@gmail.com)
  gem.homepage    = 'https://github.com/splittingred/kagerator'

  gem.required_ruby_version     = '>= 1.9.2'
  gem.required_rubygems_version = '>= 1.3.6'

  gem.files        = Dir['README.md', 'lib/**/*']
  gem.require_path = 'lib'

  gem.add_runtime_dependency "rest-client", "1.6.7"
  gem.add_runtime_dependency "json", "1.7.6"
  gem.add_runtime_dependency "symboltable", "1.0.2"
  gem.add_runtime_dependency "jruby-openssl", "0.7.7"
  #gem.add_runtime_dependency 'timers', '>= 1.0.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  #gem.add_development_dependency 'benchmark_suite'
end