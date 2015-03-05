require 'bundler/setup'
require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'can_i_use'
  
if ENV["CI"]
  require "coveralls"
  Coveralls.wear!
end
