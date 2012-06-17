# -*- encoding: utf-8 -*-
require File.expand_path('../lib/double/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Hakan Ensari']
  gem.email         = ['hakan.ensari@papercavalier.com']
  gem.description   = %q{Familiar, yet foreign}
  gem.summary       = %q{Allows you to use a constant even before it is defined.}
  gem.homepage      = 'https://github.com/hakanensari/double'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep %r{^(test|spec|features)/}
  gem.name          = 'double'
  gem.require_paths = ['lib']
  gem.version       = Double::VERSION

  gem.add_development_dependency 'rake'
end
