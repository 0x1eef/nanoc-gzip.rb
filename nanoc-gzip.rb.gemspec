# frozen_string_literal: true

require "./lib/nanoc-gzip/version"
Gem::Specification.new do |gem|
  gem.name = "nanoc-gzip.rb"
  gem.authors = ["0x1eef"]
  gem.email = ["0x1eef@protonmail.com"]
  gem.homepage = "https://github.com/0x1eef/nanoc-gzip.rb#readme"
  gem.version = Nanoc::Gzip::VERSION
  gem.licenses = ["0BSD"]
  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
  gem.summary = "A nanoc filter that compresses content in the gzip format"
  gem.description = gem.summary

  ##
  # Default gems
  # Pinned to specific versions for OpenBSD support
  gem.add_runtime_dependency "json", "= 2.6.1"
  gem.add_runtime_dependency "racc", "= 1.6.0"
  gem.add_runtime_dependency "stringio", "= 3.0.1"
  gem.add_runtime_dependency "set", "= 1.0.2"

  gem.add_runtime_dependency "nanoc", "~> 4.12"
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "redcarpet", "~> 3.5"
  gem.add_development_dependency "rspec", "~> 3.10"
  gem.add_development_dependency "standard", "~> 1.13"
  gem.add_development_dependency "rubocop-rspec", "~> 2.11"
end
