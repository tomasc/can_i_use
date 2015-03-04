require 'bundler/setup'
require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'caniuse'
  
if ENV["CI"]
  require "coveralls"
  Coveralls.wear!
end
