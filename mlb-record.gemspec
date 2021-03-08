# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/mlb_record/version"

Gem::Specification.new do |spec|
  spec.name          = "mlb-record"
  spec.version       = MlbRecord::VERSION
  spec.authors       = ["pbenton6"]
  spec.email         = ["patrick.benton6396@gmail.com"]

  spec.summary       = "Scrapes for up-to-date MLB Records"
  spec.homepage      = "http://github.com/pbenton6/mlb-record"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "'http://rubygems.org'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/pbenton6/mlb-record"
  spec.metadata["changelog_uri"] = "http://github.com/pbenton6/mlb-record/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
