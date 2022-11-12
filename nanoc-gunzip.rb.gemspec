# frozen_string_literal: true

require "./lib/nanoc/gunzip/version"
Gem::Specification.new do |gem|
  gem.name = "nanoc-gunzip.rb"
  gem.authors = ["0x1eef"]
  gem.email = ["0x1eef@protonmail.com"]
  gem.homepage = "https://github.com/0x1eef/nanoc-gunzip.rb#readme"
  gem.version = Nanoc::Gunzip::VERSION
  gem.licenses = ["MIT"]
  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
  gem.summary = "A nanoc filter that can compress textual and binary items"
  gem.description = gem.summary
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "redcarpet", "~> 3.5"
  gem.add_development_dependency "rspec", "~> 3.10"
  gem.add_development_dependency "standard", "~> 1.13"
  gem.add_development_dependency "rubocop-rspec", "~> 2.11"
end
