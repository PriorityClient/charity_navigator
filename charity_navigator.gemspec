lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'charity_navigator/version'

Gem::Specification.new do |s|
  s.name        = 'charity_navigator'
  s.version     = CharityNavigator::VERSION
  s.summary     = "Ruby Gem wrapping the Charity Navigator Data API"
  s.description = "Ruby Gem wrapping the Charity Navigator Data API"
  s.authors     = ["Pete Granger"]
  s.email       = 'pete@vipcrowd.com'
  s.homepage    = 'http://example.com/freewill'
  s.files       = ["lib/charity_navigator.rb"]
end
