# encoding: UTF-8
require File.expand_path('../lib/search_parser/version', __FILE__)

Gem::Specification.new do |s|
  s.name               = 'search_parser'
  s.homepage           = 'http://github.com/assplecake/search_parser'
  s.summary            = 'A ruby library for parsing search queries'
  s.require_path       = 'lib'
  s.authors            = ['Mark Martin']
  s.email              = ['assplecake@gmail.com']
  s.executables        = []
  s.version            = SearchParser::Version
  s.platform           = Gem::Platform::RUBY
  s.files              = Dir.glob("{lib,spec}/**/*") + %w[LICENSE README.md]

  s.add_dependency 'parslet',                  '~> 1.2'
end