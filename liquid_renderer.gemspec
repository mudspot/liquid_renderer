# -*- encoding: utf-8 -*-
require File.expand_path("../lib/liquid_renderer/version", __FILE__)


Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "liquid_renderer-mudspot"
  s.version     = LiquidRenderer::VERSION
  s.date        = '2015-02-24'
  s.summary     = "LiquidRenderer adds liquid renderer and option to include liquid filters like Rails helpers."
  s.author      = 'Rodrigo Ra, Terry Lee'
  s.email       = 'rodrigorcomp@gmail.com, terry.lee.m@gmail.com'
  s.description = "LiquidRenderer adds liquid renderer and option to include liquid filters like Rails helpers."
  s.homepage    = 'https://github.com/imaboldcompany/liquid_renderer'
  s.license     = 'MIT'
  s.files       = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]

  s.required_ruby_version     = '>= 2.0.0-p0'

  s.add_dependency('liquid',                '3.0.0')
  s.add_dependency('activesupport', '~> 4.1', '>= 4.1.19')
  s.add_dependency('bundler',               '~> 1.8')


  s.add_development_dependency('rails', '~> 4.1', '>= 4.1.19')
  s.add_development_dependency('sqlite3', '~> 0')
  s.add_development_dependency('capybara', '~> 2.4', '>= 2.4.4')
end
