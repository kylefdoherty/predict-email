# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'predict_email/version'

Gem::Specification.new do |spec|
  spec.name          = "predict_email"
  spec.version       = PredictEmail::VERSION
  spec.authors       = ["kylefdoherty"]
  spec.email         = ["kyledoherty22@gmail.com"]
  spec.summary       = %q{Gem that allows you to predict a persons email from their name and company name.}
  spec.description   = %q{Can add a csv with names and emails and then predict what a person's email will be by looking at patterns used by other people from same company.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end