# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "azure/tts/version"

Gem::Specification.new do |spec|
  spec.name          = "azure-tts"
  spec.version       = Azure::TTS::VERSION
  spec.authors       = ["Cristian Bica"]
  spec.email         = ["cristian.bica@gmail.com"]

  spec.summary       = "Azure TTS"
  spec.description   = "Text-to-speech gem based using Azure Cognitive Speech Services."
  spec.homepage      = "https://github.com/cristianbica/azure-tts"
  spec.license       = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "ruby_speech"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-around"
  spec.add_development_dependency "multi_json"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
