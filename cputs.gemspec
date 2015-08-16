# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cputs/version'

Gem::Specification.new do |spec|
  spec.name          = "cputs"
  spec.version       = Cputs::VERSION
  spec.authors       = ["JGutierrezC"]
  spec.email         = ["jegut87@gmail.com"]

  spec.summary       = %q{CPuts - CustomPuts}
  spec.description   = %q{Custom Puts is as it's name says, a customized puts command that will always remember you where are those weird console messages coming from}
  spec.homepage      = "https://github.com/JGutierrezC/cputs"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rspec", "> 3.0"
end
