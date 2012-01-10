# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "freesound/version"

Gem::Specification.new do |s|
  s.name        = "freesound-ruby"
  s.version     = Freesound::VERSION
  s.authors     = ["Alex Genco"]
  s.email       = ["alexgenco@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Freesound.org API wrapper in Ruby.}
  s.description = %q{Freesound.org API wrapper in Ruby.}

  s.rubyforge_project = "freesound-ruby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rspec")
  s.add_development_dependency("bundler", "~> 1.0.0")
  s.add_development_dependency("webmock")
  s.add_runtime_dependency("crack")
end
