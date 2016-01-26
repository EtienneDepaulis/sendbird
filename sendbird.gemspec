lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendbird/version'

Gem::Specification.new do |spec|
  spec.name          = "sendbird"
  spec.version       = Sendbird::VERSION
  spec.authors       = ["Etienne Depaulis"]
  spec.email         = ["etienne.depaulis@gmail.com"]
  spec.homepage      = "https://github.com/EtienneDepaulis/sendbird"
  spec.description   = %q{Sendbird API ruby client}
  spec.summary       = %q{Sendbird JSON API ruby client}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.10'
  spec.add_development_dependency "rake", '~> 10.5'
  spec.add_development_dependency "rspec", '~> 3.4'
  spec.add_development_dependency "vcr", '~> 3.0'
  spec.add_development_dependency "webmock", '~> 1.22'

  spec.add_runtime_dependency     "virtus", '~> 1.0'
  spec.add_runtime_dependency     "faraday", '~> 0.9'
end