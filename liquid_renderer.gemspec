# -*- encoding: utf-8 -*-
require File.expand_path("../lib/liquid_renderer/version", __FILE__)


Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "liquid_renderer"
  s.version     = LiquidRenderer::VERSION
  s.date        = '2014-02-28'
  s.summary     = "LiquidRenderer adds liquid renderer and option to include liquid filters like Rails helpers."
  s.author      = 'Rodrigo Ra'
  s.email       = 'rodrigorcomp@gmail.com'
  s.description = "LiquidRenderer adds liquid renderer and option to include liquid filters like Rails helpers."
  s.homepage    = 'https://github.com/imaboldcompany/liquid_renderer'
  s.license     = 'MIT'
  s.files       = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]

  s.required_ruby_version     = '>= 1.9.3p125'

  s.add_dependency('liquid',                '2.6.1')
  s.add_dependency('activesupport',         '~> 3.2.19')
  s.add_dependency('bundler',               '~> 1.0')


  s.add_development_dependency('rails',     '~> 3.2.17')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('capybara',  '>= 0.4.0')
end
