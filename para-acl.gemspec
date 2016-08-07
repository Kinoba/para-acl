# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Add components folder to load path, allowing para to eager load it
# on startup and recognize it in development mode
#
# This can be made standard in some way in para when we'll implement some
# kind of plugin system
#
components = File.expand_path('../app/components', __FILE__)
$LOAD_PATH.unshift(components) unless $LOAD_PATH.include?(components)

require 'para/acl/version'

Gem::Specification.new do |spec|
  spec.name          = "para-acl"
  spec.version       = Para::Acl::VERSION
  spec.authors       = ["Valentin Ballestrino"]
  spec.email         = ["vala@glyph.fr"]
  spec.summary       = %q{Para plugin to allow admins access management}
  spec.description   = %q{Para plugin to allow admins access management}
  spec.homepage      = "https://github.com/para-cms/para-acl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "para", ">= 0.4", "<= 1.0"
  spec.add_dependency "rails", ">= 4.0", "<= 6.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
