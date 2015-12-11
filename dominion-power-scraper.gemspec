# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dominion-power-scraper/version'

Gem::Specification.new do |s|
  s.name        = "dominion-power-scraper"
  s.version     = DominionPowerScraper::VERSION
  s.date        = "2015-12-11"
  s.summary     = "A webscraper that grabs customer information from Dominion Power's website"
  s.description = "A webscraper that grabs customer information from Dominion Power's website"
  s.authors     = ["Vinnie Vendemia"]
  s.email       = "vvendemia1@gmail.com"
  s.files       = `git ls-files`.split("\n")

  s.add_dependency "pry"
  s.add_dependency "activesupport"
  s.add_dependency "mechanize"

end
