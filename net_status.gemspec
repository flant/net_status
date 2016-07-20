lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'net_status/version'

Gem::Specification.new do |spec|
  spec.name          = "net_status"
  spec.version       = NetStatus::VERSION
  spec.authors       = ["Alexey Igrychev"]
  spec.email         = ["alexey.igrychev@flant.ru"]
  spec.summary       = "Net status return codes"
  spec.description   = "#{spec.summary}."
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/flant/net_status"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'i18n', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'travis', '~> 1.8', '>= 1.8.2'
  spec.add_development_dependency 'pry', '>= 0.10.3', '< 1.0'
end
